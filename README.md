# ⏱️ cloud-time — FiveM Script

**cloud-time** is a lightweight and easy-to-use FiveM script designed to manage and sync server time in a clean and efficient way. Whether you're aiming to control in-game time for roleplay scenarios or just want better control over time cycles, this script has you covered.

---

## 🚀 Features

- 🌄 Sync in-game time across all players
- 🌙 Static time or dynamic (real-time) options
- 🔄 Auto-resync on player join

---

## 📦 Requirements

- `ox_lib`

---

## 📁 Installation

1. Download or clone this resource into your `resources` folder
2. Add the following line to your `server.cfg` 
   ```cfg
   ensure cloud-time
   ```

---

## 🔧 Configuration

You can change the menu `Weather Panel` in `client.lua`:

```cfg
RegisterCommand('weatherpanel', function()
    openMainMenu()
end, false)
```

---

## 🧑‍💻 Author

[Cloud](https://github.com/Comethruuu)