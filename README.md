# 🛠️ User & Group Management Script

## 🔍 Overview
This is a powerful and interactive **Bash script** for managing users and groups on Linux systems. It simplifies and centralizes all essential administrative operations like adding, modifying, deleting, and listing users or groups—all through an easy-to-navigate command-line menu.

---

## 🚀 Features

- ✅ Add, Modify, Delete Users
- ✅ Add, Modify, Delete Groups
- ✅ List All Users and Groups
- ✅ Lock (Disable) and Unlock (Enable) User Accounts
- ✅ Change User Passwords
- ✅ Root user verification for secure execution
- ✅ Easy-to-use interactive CLI menu using `select`

---

## 🖥️ How It Works

When executed, the script displays an interactive menu. Simply:

1. Choose the desired option by number.
2. Enter required inputs like username or group name.
3. Let the script handle the system commands safely and efficiently.

---

## 📦 Requirements

- 🐧 Linux operating system
- 🔑 Root privileges (run with `sudo`)
- 📦 Standard Linux utilities:
  - `useradd`, `usermod`, `userdel`
  - `groupadd`, `groupmod`, `groupdel`
  - `passwd`, `cut`

---

## ⚙️ Usage

```bash
sudo bash sysManager.sh
