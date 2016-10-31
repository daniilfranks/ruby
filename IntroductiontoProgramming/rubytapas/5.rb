p system = "ln -s file1 file2"

p system = "ln", "-s", "file1", "file2"

p command = ["ln"]
p options = ["-s"]
p arguments = ["file1 file2"]

p %W[file1 file2]