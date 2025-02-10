## SYSC5807X Seminar - Robot Framework

This repository contains a demo project using **Robot Framework** for automated testing. Follow the steps below to set up the environment and run the tests.

## Installation Guide

### **1. Prerequisites**
Ensure you have **Python (3.7 or later)** installed. You can check your Python version using:
```sh
python --version # or python3 --version
```

If Python is not installed, download it from [Python's official website](https://www.python.org/downloads/).

---

### **2. Clone this Repository**
Clone the repository using the following command:
```sh
git clone https://github.com/uocli/sysc5807x-seminar-robot.git
cd sysc5807x-seminar-robot
```

---

### **3. Create a Virtual Environment**
It is recommended to create a virtual environment for your project:

#### **Windows**
1. Open **Command Prompt (cmd)** or **PowerShell**.
2. Create a virtual environment:
   ```sh
   python -m venv venv
   ```
3. Activate the virtual environment:
   ```sh
   venv\Scripts\activate
   ```

#### **macOS**
1. Open **Terminal**.
2. Create a virtual environment:
   ```sh
   python3 -m venv venv
   ```
3. Activate the virtual environment:
   ```sh
   source venv/bin/activate
   ```

---

### **4. Install Dependencies**
Once the virtual environment is activated, install the required dependencies using:
```sh
pip install -r requirements.txt
```

Verify the installation:
```sh
robot --version # Robot Framework 7.2 (Python 3.13.2 on darwin)
```

---

### **5. Running Tests**
Navigate to the project folder and execute the following command:
```sh
robot --outputdir results --exclude java tests/ # Excluding the tag 'java' as it requires additional setup
```
This will run all test cases inside the `tests/` directory.

To run a specific test file:
```sh
robot -d results tests/test_rest_api.robot
```

---

Happy Testing! 🚀



