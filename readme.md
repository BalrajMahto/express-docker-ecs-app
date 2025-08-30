# Express Docker AWS ECS Deployment

![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Express.js](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![AWS ECR](https://img.shields.io/badge/AWS%20ECR-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![AWS ECS](https://img.shields.io/badge/AWS%20ECS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)

This project demonstrates how to **containerize a simple Express.js server with Docker** and deploy it to **AWS Elastic Container Registry (ECR)** and **Elastic Container Service (ECS)**.

---

## 📌 Features
- Simple **Express.js API server**  
- **Dockerized** using a lightweight Node.js image  
- Deployment to **AWS ECR** for container registry  
- Deployment to **AWS ECS** for scalable container management  
- Infrastructure-independent – can run locally or on cloud  

---

## 🛠️ Tech Stack
- **Node.js / Express.js** – Backend server  
- **Docker** – Containerization  
- **AWS ECR** – Container registry  
- **AWS ECS (Fargate/EC2)** – Deployment & orchestration  

---

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>

2. Install dependencies
npm install

3. Run locally
node index.js


Server will run on http://localhost:3000.

🐳 Docker Setup
Build Docker Image
docker build -t express-ecs-app .

Run Docker Container
docker run -p 3000:3000 express-ecs-app

☁️ Deploying to AWS
1. Authenticate Docker to AWS ECR
aws ecr-public get-login-password --region us-east-1 \
| docker login --username AWS --password-stdin <your-aws-account-id>.dkr.ecr.us-east-1.amazonaws.com

2. Create an ECR Repository
aws ecr create-repository --repository-name express-ecs-app

3. Tag & Push Image to ECR
docker tag express-ecs-app:latest <your-aws-account-id>.dkr.ecr.us-east-1.amazonaws.com/express-ecs-app:latest

docker push <your-aws-account-id>.dkr.ecr.us-east-1.amazonaws.com/express-ecs-app:latest

4. Deploy on ECS

Create a Task Definition in ECS

Add the ECR image URL

Run it as a Service (Fargate or EC2 launch type)

Expose port 3000 through a Load Balancer

✅ Verification

Once deployed, visit:

http://<ecs-service-public-dns>:3000


You should see:

Hello from Express on ECS 🚀

