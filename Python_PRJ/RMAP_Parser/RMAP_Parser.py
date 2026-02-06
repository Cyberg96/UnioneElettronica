#Enrico Ubaldino
#Automatic RMAP Parser and change TLA.
from pathlib import Path

# ---------------- CRC-8 RMAP ----------------
def crc8_rmap(data: bytes) -> int:
    crc = 0x00
    poly = 0x07

    for b in data:
        crc ^= b
        for _ in range(8):
            if crc & 0x80:
                crc = ((crc << 1) & 0xFF) ^ poly
            else:
                crc = (crc << 1) & 0xFF
    return crc


# ---------------- RMAP UPDATE ----------------
def update_rmap_tla_bytes(data: bytearray, new_tla: int) -> bytearray:
    # Check Protocol ID
    if data[1] != 0x01:
        print(data[1])
        raise ValueError("Protocol ID != 0x01 → non RMAP")

    instruction = data[2]
    extended_addr_present = (instruction >> 4) & 0x01

    header_len = 15 + extended_addr_present
    crc_index = header_len #- 1

    old_tla = data[0]
    data[0] = new_tla & 0xFF

    new_crc = crc8_rmap(data[:crc_index])
    data[crc_index] = new_crc

    return data, old_tla, new_crc

# ---------------- SCRIVE FILE PER COLONNA ----------------
def write_hex_file_column(file_path: str, data: bytearray):
    with open(file_path, "w") as f:
        for b in data:
            f.write(f"{b:02X}\n")
            
# ---------------- FOLDER LOOP ----------------
def process_folder(
    input_folder: str,
    output_folder: str,
    new_tla: int
):
    input_path = Path(input_folder)
    output_path = Path(output_folder)
    output_path.mkdir(parents=True, exist_ok=True)

    dat_files = list(input_path.glob("*.dat"))

    if not dat_files:
        print("Nessun file .dat trovato")
        return

    for dat_file in dat_files:
        try:
            #data = bytearray(dat_file.read_bytes())
            data = bytearray()
            with open(dat_file, "r") as f:
                for line in f:
                    line = line.strip()  # rimuove spazi e newline
                    if line == "":
                        continue
                    # converte la stringa esadecimale in un byte
                    data.append(int(line, 16))

            updated_data, old_tla, new_crc = update_rmap_tla_bytes(
                data,
                new_tla
            )

            out_file = output_path / dat_file.name
            #out_file.write_bytes(updated_data)
            # scrive nello stesso formato "per colonna"
            write_hex_file_column(out_file, updated_data)

            print(
                f"{dat_file.name}: "
                f"TLA 0x{old_tla:02X} → 0x{new_tla:02X}, "
                f"CRC=0x{new_crc:02X}"
            )

        except Exception as e:
            print(f"{dat_file.name}: ERRORE → {e}")


# ---------------- USO ----------------
if __name__ == "__main__":
    process_folder(
        input_folder="cmd",
        output_folder="cmd_parser_out",
        new_tla=0x42
    )
