---
# ⏱️ cloud-time — FiveM Script



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
## 🖼️ Preview

- Weather Panel
![Preview](https://imgur.com/L65Hluo.png)

---

## 🧑‍💻 Author

[Cloud](https://github.com/Comethruuu)

---
