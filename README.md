<div align="center">

```
███╗   ██╗██╗██╗  ██╗██╗██████╗  ██████╗     🐳
████╗  ██║██║██║ ██╔╝██║██╔══██╗██╔═══██╗  ██████
██╔██╗ ██║██║█████╔╝ ██║██████╔╝██║   ██║ ██╔═══██
██║╚██╗██║██║██╔═██╗ ██║██╔══██╗██║   ██║ ██║   ██
██║ ╚████║██║██║  ██╗██║██║  ██║╚██████╔╝ ╚██████╔
╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═════╝
```

### **Containerized Autonomous Mobile Robot — Zero Setup. Full Power.**
*ROS 2 · Gazebo · Nav2 · Docker · One Command Deploy*

[![ROS2](https://img.shields.io/badge/ROS2-Humble-blue?style=for-the-badge&logo=ros)](https://docs.ros.org/en/humble/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Nav2](https://img.shields.io/badge/Nav2-Stack-green?style=for-the-badge)](https://nav2.ros.org/)
[![Gazebo](https://img.shields.io/badge/Gazebo-Classic-orange?style=for-the-badge)](https://classic.gazebosim.org/)

</div>

---

## 🐳 Why Docker?

No more dependency hell. No more "works on my machine." Nikiro's Docker setup gives you a **fully pre-configured ROS 2 + Nav2 + Gazebo environment** that spins up with a single command — bringup, navigation, and external server connection included.

> 🚀 Pull. Build. Launch. Done.

---

## 📦 What's Inside the Container

| Service | Auto-launched? | Description |
|---------|:-:|-------------|
| 🤖 **AMR Bringup** | ✅ | Initializes robot state & hardware interfaces |
| 🧭 **Nav2 Navigation** | ✅ | Full navigation stack with path planning |
| 🔌 **External Server** | ✅ | Exposes connection endpoint for remote access |
| 🖥️ **GUI (RViz/Gazebo)** | ✅ | X11 forwarded to your host display |

---

## ⚙️ Step 1 — Install Docker

```bash
sudo apt install docker.io
```

**Post-install: run Docker without `sudo`**
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

**Allow GUI apps from the container (X11 forwarding):**
```bash
xhost +
```
> 💡 Run `xhost +` once per session before launching. Needed for Gazebo and RViz to render on your display.

---

## 🔨 Step 2 — Clone & Build the Image

```bash
git clone https://github.com/logesh1516/Nikiro_docker.git
cd Nikiro_docker
docker build -t nikiro_amr .
```

> ⏳ **Build time: 20+ minutes** — go grab a coffee ☕. This only happens once. After that, launches are instant.

---

## 🚀 Step 3 — Launch Everything

```bash
cd Nikiro_docker
docker compose up
```

That's it. One command automatically spins up:
- ✅ Robot bringup
- ✅ Nav2 navigation stack  
- ✅ External connection server

---

## 🔁 Workflow At a Glance

```
┌─────────────────────────────────────────────────┐
│                   HOST MACHINE                  │
│                                                 │
│   xhost +          (enable display forwarding)  │
│   docker compose up  (launch all services)      │
│                        │                        │
└────────────────────────┼────────────────────────┘
                         │ X11 + ROS Topics
┌────────────────────────▼────────────────────────┐
│              NIKIRO CONTAINER                   │
│                                                 │
│  [AMR Bringup] → [Nav2 Stack] → [Ext. Server]  │
│                                                 │
│   Gazebo ──► RViz ──► /cmd_vel ──► Robot TF    │
└─────────────────────────────────────────────────┘
```

---

## 🛠️ Useful Docker Commands

**Stop all services:**
```bash
docker compose down
```

**Attach a shell into the running container:**
```bash
docker exec -it <container_name> bash
```

**List running containers:**
```bash
docker ps
```

**Rebuild after making changes:**
```bash
docker build --no-cache -t nikiro_amr .
```

---

## 🔗 Related Repository

The full Nikiro simulation (SLAM, conveyor, MyCobot arm) lives here:

> 👉 [Nikiro_simulation](https://github.com/logesh1516/Nikiro_simulation)

---

<div align="center">

Built with 🐳 + 🤖 by **Logesh**  
*Because setting up ROS 2 from scratch should be a choice, not a requirement.*

</div>
