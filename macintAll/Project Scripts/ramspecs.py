import subprocess

output = subprocess.check_output(["system_profiler", "SPMemoryDataType"])
output = output.decode("utf-8")
lines = output.split("\n")

module_count = 0  # number of RAM slots
total_ram_size = 0  # total RAM size
ram_speed = ""  # RAM speed
ram_technology = ""  # RAM technology

for line in lines:
    if "Size" in line:  # size of the RAM module (e.g. "8 Gb")
        size = line.split(":")[-1].strip()
        total_ram_size += int(size.split()[0])
    elif "Type" in line:  # type of the RAM module (e.g. "DDR4")
        ram_technology = line.split(":")[-1].strip()
    elif "Speed" in line:  # speed of the RAM module (e.g. "2666 MHz")
        ram_speed = line.split(":")[-1].strip()

module_count = len([line for line in lines if "Size" in line])

modules_amount = f"{module_count}x"
total_ram_size = f"{total_ram_size} Gb"
ram_speed = f"{ram_speed}"
ram_technology = f"{ram_technology}"

print(modules_amount)
print(total_ram_size)
print(ram_speed)
print(ram_technology)
