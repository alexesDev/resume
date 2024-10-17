#!/usr/bin/env python3

import requests
import os
import sys
import re

api_key = os.getenv('OPENAI_API_KEY')
url = "https://api.openai.com/v1/chat/completions"

source_file = "index.html" # sys.argv[1]
target_file = "en.html"

def check_value(val, message):
    if not val:
        print(message)
        sys.exit(1)

def read_file(file):
    with open(file, 'r') as f:
        return f.read()

def write_file(file, content):
    with open(file, 'w') as f:
        f.write(content.strip())

check_value(api_key, "Please set OPENAI_API_KEY environment variable")
check_value(source_file, "Please provide a source file")

content = """Translate my resume to English.
Do not add any new information.
Do not remove any existing information.
Return only final resume content.
Save the original html markup.
Change /resume/ru.pdf to /resume/en.pdf.

{source_file_countent}
"""

content = content.format(
    source_file_countent=read_file(source_file)
)

if len(content) > 8192:
    print("Content is too long. Please provide a shorter content.", len(content))
    sys.exit(1)

headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {api_key}"
}

data = {
    "model": "gpt-4o",
    "messages": [
        {"role": "system", "content": "You are a senior golang developer with 10 years of experience."},
        {"role": "user", "content": content},
    ]
}

response = requests.post(url, headers=headers, json=data)
result = response.json()["choices"][0]["message"]["content"]

# extract ```go code block by regex
re_result = re.search(r'```([a-zA-Z]+)\n(.*?)```', result, re.DOTALL)

if re_result:
    write_file(target_file, re_result.group(2))
    print(f"Refactored {target_file} file is saved.")
else:
    write_file(target_file, result)
    print(f"Refactored {target_file} file is saved.")
