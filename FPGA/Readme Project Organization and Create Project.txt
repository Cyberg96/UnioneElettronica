Enrico Ubaldino

project/
│
├── src/                  # Cartella dei sorgenti
│   ├── module1.sv
│   └── module2.sv
│
├── tb/                   # Cartella dei testbench
│   ├── tb_module1.sv
│   └── tb_module2.sv
│
├── scripts/              # Cartella degli script per le simulazioni
│   ├── run_sim.do        # Script QuestaSim per lanciare le simulazioni
│   └── run_all.sh        # Script bash per lanciare simulazioni automatiche
│
└── results/              # Cartella per i risultati della simulazione

// Create
mkdir project
cd project
mkdir src
mkdir tb
mkdir scripts
mkdir results
