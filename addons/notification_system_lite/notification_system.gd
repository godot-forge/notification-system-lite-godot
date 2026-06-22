extends Node

const MAX_QUEUE := 4

signal notification_pushed(id: String, message: String)
signal notification_dismissed(id: String)

var _queue: Array = []
var _id_counter: int = 0

func push(message: String, duration: float = 3.0) -> String:
	if _queue.size() >= MAX_QUEUE:
		push_warning("Notifications Lite: max queue size %d reached." % MAX_QUEUE)
		return ""
	_id_counter += 1
	var id: String = "notif_%d" % _id_counter
	var entry: Dictionary = {
		"id": id, "message": message,
		"duration": duration, "elapsed": 0.0,
	}
	_queue.append(entry)
	emit_signal("notification_pushed", id, message)
	return id

func dismiss(id: String) -> void:
	for i in range(_queue.size()):
		if _queue[i]["id"] == id:
			_queue.remove_at(i)
			emit_signal("notification_dismissed", id)
			return

func dismiss_all() -> void:
	var ids: Array = []
	for n in _queue:
		ids.append(n["id"])
	_queue.clear()
	for id in ids:
		emit_signal("notification_dismissed", id)

func pending() -> Array:
	var result: Array = []
	for n in _queue:
		result.append({"id": n["id"], "message": n["message"], "duration": n["duration"]})
	return result

func pending_count() -> int:
	return _queue.size()

func _process(delta: float) -> void:
	var expired: Array = []
	for n in _queue:
		n["elapsed"] += delta
		if n["duration"] > 0.0 and n["elapsed"] >= n["duration"]:
			expired.append(n["id"])
	for id in expired:
		dismiss(id)
