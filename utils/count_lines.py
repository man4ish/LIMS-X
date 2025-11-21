import os

# Folders to exclude
EXCLUDE_DIRS = {'venv', 'venv_sys', '.venv', '__pycache__', '*.egg-info'}
# File extensions to include
INCLUDE_EXTENSIONS = {'.py', '.html', '.yml', '.sh', '.bash'}
# Files with specific names to include
INCLUDE_FILES = {'Dockerfile', '.env'}

total_lines = 0
file_lines = {}

for root, dirs, files in os.walk('.'):
    # Skip excluded directories
    dirs[:] = [d for d in dirs if d not in EXCLUDE_DIRS]

    for file in files:
        path = os.path.join(root, file)
        ext = os.path.splitext(file)[1]

        if ext in INCLUDE_EXTENSIONS or file in INCLUDE_FILES:
            try:
                with open(path, 'r', encoding='utf-8') as f:
                    lines = sum(1 for _ in f)
                    total_lines += lines
                    file_lines[path] = lines
            except Exception as e:
                print(f"Could not read {path}: {e}")

# Print per-file lines
for path, lines in file_lines.items():
    print(f"{lines:5} {path}")

print(f"\nTotal lines of code: {total_lines}")
