# Phonebook Demo: Hybrid Cloud on OpenShift

This project is a full-stack contact management application designed to demonstrate a **Hybrid Cloud Architecture** within **Red Hat OpenShift**. It showcases the seamless integration of modern containerized microservices with traditional virtualized workloads using **OpenShift Virtualization**.

---

## 🏗 Architecture & Infrastructure

The core purpose of this demo is to highlight how OpenShift manages diverse workloads in a single unified project (namespace).

* **Application Layer (Containers):** The Node.js/Express backend and React frontend are deployed as standard OpenShift containers.
* **Data Layer (Virtual Machine):** The **PostgreSQL** database runs inside a **Virtual Machine** (managed by OpenShift Virtualization/KubeVirt) instead of a container.
* **Unified Networking:** Both the containers and the VM reside on the same **internal Pod network**.
* **Enhanced Security:** The database VM is **never exposed** to external networks (VLANs, Client networks, or the Public Internet). It is only reachable by the application container via internal service discovery.

---

## 🛠 Tech Stack

* **Frontend:** React.js
* **Backend:** Node.js & Express.js
* **Database:** PostgreSQL running on a **RHEL Virtual Machine**
* **Platform:** OpenShift Container Platform
* **Virtualization:** OpenShift Virtualization

---

## ⚙️ Configuration & Environment Variables

To bridge the gap between the containerized application and the virtualized database, the following environment variables must be configured in the application's deployment settings.

| Variable | Description |
| --- | --- |
| **`DB_HOST`** | The internal Service DNS name or IP address of the Database VM. |
| **`DB_NAME`** | The specific database name within the PostgreSQL instance. |
| **`DB_USER`** | The username authorized to access the database. |
| **`DB_PASSWORD`** | The password for the database user (Should be mapped to a Secret). |
| **`DB_PORT`** | The internal port where PostgreSQL is listening (typically 5432). |

> **Note:** These variables ensure that the containerized app can communicate with the VM over the secure, private pod network.

---

## 🚀 Deployment on OpenShift

### 1. Database VM Setup

Ensure your PostgreSQL Virtual Machine is running within the same project and has a Service defined to expose port `5432` internally.

### 2. Application Deployment

Deploy the phonebook container. You can set the environment variables via the OpenShift Web Console under the **Deployment > Environment** tab or via the CLI:

```bash
oc set env deployment/phonebook \
  DB_HOST=postgres-vm-service \
  DB_NAME=phonebook \
  DB_USER=admin \
  DB_PASSWORD=yoursecurepassword \
  DB_PORT=5432

```

### 3. Verification

Once deployed, the application will interact with the database VM through the internal cluster network, demonstrating a fully functional hybrid environment.

---

## 📡 API Endpoints

| Method | Endpoint | Description |
| --- | --- | --- |
| `GET` | `/api/persons` | Retrieve all contacts from the VM database |
| `POST` | `/api/persons` | Add a new contact to the VM database |
| `DELETE` | `/api/persons/:id` | Remove a contact |
| `GET` | `/info` | Show entry count and server status |

---

## 📝 License

This project is open-source and available under the MIT License.

*Created by [dlabreu*](https://github.com/dlabreu)

---
