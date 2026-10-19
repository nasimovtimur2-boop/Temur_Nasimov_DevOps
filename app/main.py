import json
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

STUDENT = {
    "name": os.getenv("STUDENT_NAME", "Temur"),
    "surname": os.getenv("STUDENT_SURNAME", "Nasimov"),
    "group": os.getenv("STUDENT_GROUP", "IT 2 2312"),
    "student_id": os.getenv("STUDENT_ID", "31915"),
    "course": "DevOps",
}

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path not in ("/", "/health", "/info"):
            self.send_error(404)
            return
        data = {"status": "ok"} if self.path == "/health" else {
            "message": "DevOps Student Application is running successfully!",
            "student": STUDENT,
        }
        body = json.dumps(data, ensure_ascii=False, indent=2).encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

if __name__ == "__main__":
    print("DevOps Student Application", flush=True)
    for key, value in STUDENT.items():
        print(f"{key}: {value}", flush=True)
    ThreadingHTTPServer(("0.0.0.0", int(os.getenv("PORT", "8080"))), Handler).serve_forever()
