# 🚀 The Demo Repo

Welcome to my repository of **coding demonstrations** and **proof-of-concept projects**!

This repository serves as a centralized collection of short, functional applications, coding experiments, and technical showcases — primarily focused on **Red Hat technologies** like **Ansible Automation Platform (AAP)**, **OpenShift Container Platform (OCP)**, and **OpenShift Virtualization (OCP-V)**.

Think of it as a workshop where I explore **automation**, **container orchestration**, and **hybrid cloud** solutions.

---

## 🌟 Demo Highlights

The demos housed here demonstrate **practical use cases** for Red Hat products:

| **Category**                  | **Typical Tech Stack**                  | **Purpose** |
|-------------------------------|----------------------------------------|--------------|
| **Automation & Configuration** | Ansible Automation Platform (AAP)      | Demonstrating automated deployment, configuration management, execution environments, and dynamic inventories. |
| **Container Orchestration**    | OpenShift Container Platform (OCP)     | Showcasing deployment strategies (Blue/Green, Canary), Operators, serverless functions, and GitOps workflows (ArgoCD/Tekton). |
| **Virtualization & Hybrid Cloud** | OpenShift Virtualization (OCP-V)    | Examples of managing traditional Virtual Machines alongside containers, VM migration, and hybrid workload management using KubeVirt. |
| **Utilities & Integration**    | Python, Shell Scripts                  | Small tools for interacting with RH product APIs, generating reports, and running validation checks. |

---

## 📁 Repository Structure

Every folder in the root directory represents a single, self-contained demo.

```
demos/
├── aap/          <- Ansible Automation Platform demo (e.g., provisioning a resource)
├── ocp/          <- OpenShift ArgoCD/Pipelines demo (e.g., continuous deployment)
├── ocp-virt/     <- OpenShift Virtualization demo (e.g., VM creation and management)
└── README.md
```

---

## ⚙️ How to Navigate and Run a Demo

1. **Clone the repository:**
   ```bash
   git clone [Your Repository URL Here]
   cd demos
   ```

2. **Select a Demo:**
   Navigate into the specific folder you are interested in, for example:
   ```bash
   cd ocp/
   ```

3. **Check the Local Instructions:**
   Each demo folder usually contains its own small `README.md` or a detailed comment block explaining:
   - Setup steps
   - Dependencies and installation
   - Run commands

   > **Note:** Some demos may require access to an existing **AAP** or **OCP** environment.

4. **Run the Demo:**
   Execute the appropriate command — for example:
   ```bash
   ansible-playbook playbook.yml
   ```
   or
   ```bash
   oc apply -f manifests/
   ```

---

## 🤝 Stay Connected

Have suggestions or found an issue with one of the demos?
Feel free to **open an Issue** in this repository!

---

**Happy coding and automating!**
