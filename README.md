# Notification System Lite — Godot 4

Free Godot 4 addon for push notifications / toast messages with auto-dismiss.

## Features (Lite — Free, max 4 in queue)

- `push(message, duration)` → returns id
- `dismiss(id)` / `dismiss_all()`
- `pending()` / `pending_count()`
- Auto-dismiss after duration (via `_process`)
- Signals: `notification_pushed(id, message)` / `notification_dismissed(id)`

## Quick Start

```gdscript
# Autoload: Notifications
Notifications.notification_pushed.connect(func(id, msg): show_toast(msg))
Notifications.push("Achievement Unlocked!", 3.0)
```

## Upgrade to PRO

[Notification System PRO](https://godot-forge.itch.io/notification-system-pro-godot) adds:
- Unlimited queue
- 4 types: INFO / SUCCESS / WARNING / ERROR
- Priority ordering (CRITICAL first)
- Click callbacks (on_click Callable)
- Pause/resume auto-dismiss
- History log
- max_visible control

---
Made with ♥ by [GodotForge](https://itch.io/profile/godot-forge)
