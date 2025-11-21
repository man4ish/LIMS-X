import requests

BASE_URL = "http://127.0.0.1:8000/api/"

# -------------------------
# Test Users (ensure these exist in DB and have correct groups)
# -------------------------
USERS = {
    "admin": {"username": "admin", "password": "admin123"},
    "tech": {"username": "tech", "password": "tech123"},
    "pi": {"username": "pi", "password": "pi123"},
    "viewer": {"username": "viewer", "password": "viewer123"}
}

# -------------------------
# Helper Functions
# -------------------------
def get_access_token(username, password):
    """Get JWT access token for a user."""
    url = f"{BASE_URL}token/"
    resp = requests.post(url, json={"username": username, "password": password})
    if resp.status_code == 200:
        return resp.json()["access"]
    print(f"Failed to get token for {username}: {resp.text}")
    return None

def test_endpoint(user_token, endpoint, method="GET", data=None):
    """Call an API endpoint with JWT token and print result."""
    if not user_token:
        print(f"Skipping {endpoint} [{method}] due to missing token")
        return
    headers = {"Authorization": f"Bearer {user_token}"}
    url = f"{BASE_URL}{endpoint}/"
    if method == "GET":
        resp = requests.get(url, headers=headers)
    elif method == "POST":
        resp = requests.post(url, headers=headers, json=data)
    elif method == "PUT":
        resp = requests.put(url, headers=headers, json=data)
    elif method == "PATCH":
        resp = requests.patch(url, headers=headers, json=data)
    elif method == "DELETE":
        resp = requests.delete(url, headers=headers)
    else:
        return
    print(f"{endpoint} [{method}] status={resp.status_code}, response={resp.text[:200]}")

# -------------------------
# Main Testing Function
# -------------------------
def main():
    # Get tokens for all users
    tokens = {role: get_access_token(**creds) for role, creds in USERS.items()}

    # -------------------------
    # SampleViewSet
    # -------------------------
    print("\n--- Testing SampleViewSet ---")
    sample_data = {
        "label": "Test_Sample_Tech",
        "description": "DNA sample created by Tech",
        "organism": 2,           # ensure ID exists
        "project": 4,            # ensure ID exists
        "sample_type": 2,        # ensure ID exists
        "specimen_source": 3     # ensure ID exists
    }

    # GET works for everyone
    test_endpoint(tokens["tech"], "samples", "GET")
    test_endpoint(tokens["pi"], "samples", "GET")
    test_endpoint(tokens["viewer"], "samples", "GET")

    # POST only allowed for tech/admin
    test_endpoint(tokens["tech"], "samples", "POST", data=sample_data)   # should succeed
    test_endpoint(tokens["admin"], "samples", "POST", data=sample_data)  # should succeed
    test_endpoint(tokens["pi"], "samples", "POST", data=sample_data)     # should fail (403)
    test_endpoint(tokens["viewer"], "samples", "POST", data=sample_data) # should fail (403)

    # -------------------------
    # LibraryViewSet
    # -------------------------
    print("\n--- Testing LibraryViewSet ---")
    library_data = {
        "label": "Lib_Test_Admin",
        "description": "WGS Library",
        "library_type": 3,   # FK ID from LibraryType
        "sample": 15,        # FK ID from Sample
        "protocol": 1,       # FK ID from Protocol
        "bardex": 1,         # FK ID from Bardex
        "employee_id": 101,
        "date_created": "2025-05-08",
        "insert_size": 350,
        "client_provided": None,
        "active": True
    }

    # POST only allowed for Admin
    test_endpoint(tokens["admin"], "libraries", "POST", data=library_data)  # succeed
    test_endpoint(tokens["tech"], "libraries", "POST", data=library_data)   # fail
    test_endpoint(tokens["viewer"], "libraries", "GET")                     # read-only

    # -------------------------
    # ProjectViewSet
    # -------------------------
    print("\n--- Testing ProjectViewSet ---")
    project_data = {
        "label": "Test_Project_Admin",
        "description": "Project created for testing",
        "gemstone": 1   # FK ID from Gemstone table
    }

    # POST allowed for Admin and PI
    test_endpoint(tokens["admin"], "projects", "POST", data=project_data)  # succeed
    test_endpoint(tokens["pi"], "projects", "POST", data=project_data)     # succeed
    test_endpoint(tokens["viewer"], "projects", "POST", data=project_data) # fail

if __name__ == "__main__":
    main()
