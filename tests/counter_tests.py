import pytest
from subprocess import run

@pytest.fixture(scope="module")
def setup_service():
    run(["sudo", "service", "counter", "start"])
    yield
    run(["sudo", "service", "counter", "stop"])


def test_service_running(setup_service):
    res = run(["sudo", "systemctl", "is-active", "counter.service"], capture_output=True)
    assert res.returncode == 0
    assert res.stdout.decode().strip() == "active"

def test_kill_signal(setup_service):
    res = run(["sudo", "pidof", "python3", "systemd_counter.py", "-s"], capture_output=True)
    assert res.returncode == 0
    pid_str = res.stdout.decode().strip()
    res = run(["sudo", "kill", "-TERM", pid_str])
    assert res.returncode == 0
    res = run(["sudo", "systemctl", "is-active", "counter.service"], capture_output=True)
    assert res.returncode != 0
    assert res.stdout.decode().strip() == "inactive"


def test_current_count_file(setup_service):
    f = open("/tmp/currentCount.out", "r")
    line = f.readline()
    assert line[-2] == '0'
    assert line[-3] == '#'

