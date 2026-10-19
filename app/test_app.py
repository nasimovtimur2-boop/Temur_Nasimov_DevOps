import os
import unittest
from unittest.mock import patch
from urllib.request import urlopen
from http.server import ThreadingHTTPServer
from threading import Thread
from main import Handler, STUDENT

class ApplicationTests(unittest.TestCase):
    def test_student_fields(self):
        self.assertEqual(set(STUDENT), {"name", "surname", "group", "student_id", "course"})
        self.assertTrue(STUDENT["name"])

    def test_health_endpoint(self):
        server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
        worker = Thread(target=server.serve_forever, daemon=True)
        worker.start()
        try:
            with urlopen(f"http://127.0.0.1:{server.server_port}/health", timeout=3) as r:
                self.assertEqual(r.status, 200)
                self.assertIn(b'"ok"', r.read())
        finally:
            server.shutdown()
            server.server_close()

if __name__ == "__main__":
    unittest.main()
