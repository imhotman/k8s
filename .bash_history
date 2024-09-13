yum install docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user 
docker ps
yum install git -y
cat << EOF > eks-demo-cluster.yaml
---
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig


metadata:
  name: eks-demo # 생성할 EKS 클러스터명
  region: ${AWS_REGION} # 클러스터를 생성할 리전
  version: "1.27" #


vpc:
  cidr: "10.0.0.0/16" # 클러스터에서 사용할 VPC의 CIDR
  nat:
    gateway: HighlyAvailable


managedNodeGroups:
  - name: node-group # 클러스터의 노드 그룹명
    instanceType: m5.large # 클러스터 워커 노드의 인스턴스 타입
    desiredCapacity: 1 # 클러스터 워커 노드의 갯수
    volumeSize: 20  # 클러스터 워커 노드의 EBS 용량 (단위: GiB)
    privateNetworking: true
    iam:
      withAddonPolicies:
        imageBuilder: true # Amazon ECR에 대한 권한 추가
        albIngress: true  # albIngress에 대한 권한 추가
        cloudWatch: true # cloudWatch에 대한 권한 추가
        autoScaler: true # auto scaling에 대한 권한 추가
        ebs: true # EBS CSI Driver에 대한 권한 추가


cloudWatch:
  clusterLogging:
    enableTypes: ["*"]


iam:
  withOIDC: true
EOF

ls
exit
eksctl create cluster -f eks-demo-cluster.yaml 
aws sts get-caller-identity --query Arn | grep eksworkspace-admin
python3 --version
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
echo $TOKEN
export AWS_REGION=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
echo $AWS_REGION
eksctl create cluster -f eks-demo-cluster.yaml 
vi eks-demo-cluster.yaml 
eksctl create cluster -f eks-demo-cluster.yaml 
kubectl get node
kubectl get nodes
eksctl delete cluster -f eks-demo-cluster.yaml 
kubectl get nodes
kubectl get all
eksctl create cluster --name testeks1 --version 1.27 --region=us-east-2 --managed
kubectl get nodes
sudo chmod +x /usr/local/bin/kubectl
kubectl get nodes
cat <<EOF > ~/nginx-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nginx
  labels:
    run: my-nginx
spec:
  ports:
  - port: 80
    protocol: TCP
  selector:
    run: my-nginx
  type: LoadBalancer
EOF

ls
exit
kubectl get nodes
kubectl get all
kubectl get all -o wide
curl eksctl-testeks1-nodegroup-ng-80ed23db
curl acb1857d05ef9456f96d079bb5c2ba20-36683458.us-east-2.elb.amazonaws.com
curl acb1857d05ef9456f96d079bb5c2ba20-36683458.us-east-2.elb.amazonaws.coms
kubectl log
kubectl logs 13.59.190.52
kubectl logs my-nginx-5474bdf9f6-c2wr8
kubectl get all -o wide

kubectl get all -o wide
ls
kubectl get all
kubectl apply -f nginx-service.yaml 
kubectl get all
cat nginx-service.yaml 
kubectl delete nginx-service.yaml 
kubectl delete svc my-nginx 
cat nginx-service.yaml 
vi nginx-service.yaml 
kubectl apply -f nginx-service.yaml 
kubectl get all
kubectl delete svc my-nginx 
vi nginx-service.yaml 
kubectl apply -f nginx-service.yaml 
kubectl get all
kubectl delete  nginx-service.yaml 
kubectl delete deploy my-nginx
kubectl delete svc my-nginx
kubectl get all
vi nginx-service.yaml 
ls
kubectl get all
kubectl apply -f nginx-service.yaml 
kubectl get all
vi nginx-service.yaml 
kubectl exec -it my-nginx-5474bdf9f6-2ljnv -- /bin/sh
kubectl get all
vi nginx-service.yaml 
kubectl delete svc my-nginx
kubectl delete deploy my-nginx
kubectl get all
kubectl apply -f nginx-service.yaml 
kubectl get all
kubectl delete svc my-nginx
vi nginx-service.yaml 
rm nginx-service.yaml 
ls
vi nginx-service.yaml 
vi nginx-service1.yaml 
kubectl apply -f nginx-service1.yaml 
kubeget all
kubect lget all
kubectl get all
eksctl utils associate-iam-oidc-provider --cluster testeks1 --approve
eksctl create iamserviceaccount   --cluster=ZIGI-EKS   --namespace=kube-system   --name=aws-load-balancer-controller   --attach-policy-arn=arn:aws:iam::710278559713:policy/ZIGILBCTRLIAMPolicy   --override-existing-serviceaccounts   --approve
kubectl get all
vi nginx-service1.yaml 
kubectl get all
kubectl delete deploy my-nginx
kubectl delete svc my-nginx
kubectl get all
kubectl apply -f nginx-service1.yaml
kubectl 
vi nginx-service1.yaml 
kubectl get all
eksctl get iamserviceaccount --cluster testeks1 --region us-east-2
kubectl get all
kubectl delete my-nginx
kubectl delete deploy my-nginx
kubectl delete svc my-nginx
rolearn=arn:aws:iam::061039804626:role/eksworkspace-admin
echo ${rolearn}
eksctl create iamidentitymapping --cluster testeks1 --arn ${rolearn} --group system:masters --username admin
aws configure list
kubectl apply -f nginx-service1.yaml 
kubectl get all
mkdir -p manifests/alb-ingress-controller && cd manifests/alb-ingress-controller
ls
eksctl utils associate-iam-oidc-provider     --region ${AWS_REGION}     --cluster eks-demo     --approve
aws configure
aws configure list
aws sts get-caller-identity
eksctl utils associate-iam-oidc-provider     --region ${AWS_REGION}     --cluster testeks1     --approve
eksctl utils associate-iam-oidc-provider     --region: us-east-2    --cluster testeks1     --approve
eksctl utils associate-iam-oidc-provider     --region us-east-2     --cluster teseks1     --approve
eksctl utils associate-iam-oidc-provider \                                                          
    --region us-east-2     --cluster testeks1     --approve
aws eks describe-cluster --name eks-demo --query "cluster.identity.oidc.issuer" --output text
ls
ls -al
cd
ls
cd manifests/
kubeclt get nodes
kubectl get nodes
kubectl get all -o wide
git
kubectl get all -o wide
kubectl describe configmap -n kube-system aws-auth
eksctl get iamserviceaccount --cluster testeks1 --region us-east-2
ls -ld ~/.kube/config
ls -ld ${HOME}/.aws/credentials
aws sts get-caller-identity --query Arn | grep eksworkspace-admin
aws configure set default.region
aws configure set default.region ${AWS_REGION}
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
echo $TOKEN
export AWS_REGION=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
echo $AWS_REGION
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
aws configure set default.region ${AWS_REGION}
aws configure get default.region
export ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
df -Th
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
kubectl get nodes
rolearn=arn:aws:iam::061039804626:role/eksworkspace-admin
echo ${rolearn}
eksctl get iamserviceaccount --cluster testeks1 --region us-east-2
eksctl create iamidentitymapping --cluster eks-demo --arn ${rolearn} --group system:masters --username admin
eksctl create iamidentitymapping --cluster testeks1 --arn ${rolearn} --group system:masters --username admin
eksctl get iamserviceaccount --cluster testeks1 --region us-east-2
kubectl describe configmap -n kube-system aws-auth
eksctl get iamserviceaccount --cluster testeks1
kubectl describe configmap -n kube-system aws-auth
watch kubectl get all -o wide
ls
cd manifests/
ls
cd alb-ingress-controller/
ls
eksctl utils associate-iam-oidc-provider     --region ${AWS_REGION}     --cluster testeks1     --approve
echo http://$(kubectl get ingress/flask-backend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')/contents/aws
kubeclt get all -o wide
kubectl get all -o wide
ls
cd manifests/
ls
cd alb-ingress-controller/
ls
eksctl utils associate-iam-oidc-provider     --region us-east-2     --cluster testeks1     --approve
aws eks describe-cluster --name testeks1 --query "cluster.identity.oidc.issuer" --output text
aws iam list-open-id-connect-providers | grep D1D05B697F5F21C7C060FCFD0021FB9C
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
aws iam create-policy     --policy-name AWSLoadBalancerControllerIAMPolicy     --policy-document file://iam_policy.json
eksctl create iamserviceaccount     --cluster testeks1     --namespace kube-system     --name aws-load-balancer-controller     --attach-policy-arn arn:aws:iam::$ACCOUNT_ID:policy/AWSLoadBalancerControllerIAMPolicy     --override-existing-serviceaccounts     --approve
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml
ls
curl -Lo v2_5_4_full.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_full.yaml
sed -i.bak -e '596,604d' ./v2_5_4_full.yaml
sed -i.bak -e 's|your-cluster-name|eks-demo|' ./v2_5_4_full.yaml
ls
rm v2_5_4_full.yaml
rm v2_5_4_full.yaml.bak
ls
curl -Lo v2_5_4_full.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_full.yaml
ls
sed -i.bak -e '596,604d' ./v2_5_4_full.yaml
sed -i.bak -e 's|your-cluster-name|testeks1|' ./v2_5_4_full.yaml
kubectl apply -f v2_5_4_full.yaml
curl -Lo v2_5_4_ingclass.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.4/v2_5_4_ingclass.yaml
kubectl apply -f v2_5_4_ingclass.yaml
kubectl get deployment -n kube-system aws-load-balancer-controller
kubectl get sa aws-load-balancer-controller -n kube-system -o yaml
kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o "aws-load-balancer[a-zA-Z0-9-]+")
ALBPOD=$(kubectl get pod -n kube-system | egrep -o "aws-load-balancer[a-zA-Z0-9-]+")
kubectl describe pod -n kube-system ${ALBPOD}
cat <<EOF> flask-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-flask-backend
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: demo-flask-backend
  template:
    metadata:
      labels:
        app: demo-flask-backend
    spec:
      containers:
        - name: demo-flask-backend
          image: $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-flask-backend:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
EOF

cat <<EOF> flask-service.yaml
---
apiVersion: v1
kind: Service
metadata:
  name: demo-flask-backend
  annotations:
    alb.ingress.kubernetes.io/healthcheck-path: "/contents/aws"
spec:
  selector:
    app: demo-flask-backend
  type: NodePort
  ports:
    - port: 8080 # 서비스가 생성할 포트  
      targetPort: 8080 # 서비스가 접근할 pod의 포트
      protocol: TCP
EOF

cat <<EOF> flask-ingress.yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
    name: "flask-backend-ingress"
    namespace: default
    annotations:
      alb.ingress.kubernetes.io/scheme: internet-facing
      alb.ingress.kubernetes.io/target-type: ip
      alb.ingress.kubernetes.io/group.name: eks-demo-group
      alb.ingress.kubernetes.io/group.order: '1'
spec:
    ingressClassName: alb
    rules:
    - http:
        paths:
          - path: /contents
            pathType: Prefix
            backend:
              service:
                name: "demo-flask-backend"
                port:
                  number: 8080
EOF

cat <<EOF> flask-ingress.yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
    name: "flask-backend-ingress"
    namespace: default
    annotations:
      alb.ingress.kubernetes.io/scheme: internet-facing
      alb.ingress.kubernetes.io/target-type: ip
      alb.ingress.kubernetes.io/group.name: eks-demo-group
      alb.ingress.kubernetes.io/group.order: '1'
spec:
    ingressClassName: alb
    rules:
    - http:
        paths:
          - path: /contents
            pathType: Prefix
            backend:
              service:
                name: "demo-flask-backend"
                port:
                  number: 8080
EOF

echo http://$(kubectl get ingress/flask-backend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')/contents/aws
kubectl apply -f flask-deployment.yaml
kubectl apply -f flask-service.yaml
kubectl apply -f flask-ingress.yaml
echo http://$(kubectl get ingress/flask-backend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')/contents/aws
cat <<EOF> nodejs-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-nodejs-backend
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: demo-nodejs-backend
  template:
    metadata:
      labels:
        app: demo-nodejs-backend
    spec:
      containers:
        - name: demo-nodejs-backend
          image: public.ecr.aws/y7c9e1d2/joozero-repo:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 3000
EOF

cat <<EOF> nodejs-service.yaml
---
apiVersion: v1
kind: Service
metadata:
  name: demo-nodejs-backend
  annotations:
    alb.ingress.kubernetes.io/healthcheck-path: "/services/all"
spec:
  selector:
    app: demo-nodejs-backend
  type: NodePort
  ports:
    - port: 8080
      targetPort: 3000
      protocol: TCP
EOF

cat <<EOF> nodejs-ingress.yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: "nodejs-backend-ingress"
  namespace: default
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/group.name: eks-demo-group
    alb.ingress.kubernetes.io/group.order: '2'
spec:
  ingressClassName: alb
  rules:
  - http:
        paths:
          - path: /services
            pathType: Prefix
            backend:
              service:
                name: "demo-nodejs-backend"
                port:
                  number: 8080
EOF

kubectl apply -f nodejs-deployment.yaml
kubectl apply -f nodejs-service.yaml
kubectl apply -f nodejs-ingress.yaml
echo http://$(kubectl get ingress/nodejs-backend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')/services/all
aws ecr create-repository --repository-name demo-frontend --image-scanning-configuration scanOnPush=true --region ${AWS_REGION}
aws ecr create-repository --repository-name demo-frontend1 --image-scanning-configuration scanOnPush=true --region ${AWS_REGION}
docker pull rosehs00/demo-frontend
docker tag rosehs00/demo-frontend:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-frontend:latest
docker tag rosehs00/demo-fronten1d:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-fronted1:latest
docker tag rosehs00/demo-fronten1d:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-frontend1:latest
docker tag rosehs00/demo-frot1en1d:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-frontend1:latest
docker tag rosehs00/demo-frontend:latest1 $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-frontend1:latest
docker images
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-frontend:latest
cd /home/ec2-user/environment/manifests
cat <<EOF> frontend-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-frontend
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: demo-frontend
  template:
    metadata:
      labels:
        app: demo-frontend
    spec:
      containers:
        - name: demo-frontend
          image: $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/demo-frontend:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 80
EOF

cat <<EOF> frontend-service.yaml
---
apiVersion: v1
kind: Service
metadata:
  name: demo-frontend
  annotations:
    alb.ingress.kubernetes.io/healthcheck-path: "/"
spec:
  selector:
    app: demo-frontend
  type: NodePort
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF

cat <<EOF> frontend-ingress.yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: "frontend-ingress"
  namespace: default
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/group.name: eks-demo-group
    alb.ingress.kubernetes.io/group.order: '3'
spec:
  ingressClassName: alb
  rules:
    - http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: "demo-frontend"
                port:
                  number: 80
EOF

kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml
kubectl apply -f frontend-ingress.yaml
echo http://$(kubectl get ingress/frontend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')
kubectl get all
kubectl get all -o wide
cd
ls
mkdir mid1
ls
cd mid1/
ls
kubectl get all
 ls
ls -al
cd
ls
cd manifests/
ls
cd alb-ingress-controller/
ls
vi v2_5_4_ingclass.yaml 
vi v2_5_4_full.yaml
vi v2_5_4_ingclass.yaml 
vi frontend-ingress.yaml 
vi frontend-service.yaml 
vi ftest-svc.yaml
vi frontend-ingress.yaml 
vi ftest-svc.yaml
vi frontend-deployment.yaml 
vi ftest-de.yaml
vi frontend-ingress.yaml 
vi ftest-in.yaml
ls
kubectl apply -f ftest-de.yaml
kubectl apply -f ftest-svc.yaml
kubectl apply -f ftest-in.yaml
echo http://$(kubectl get ingress/frontend-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}')
vi ftest-de.yaml
vi ftest-svc.yaml
kubectl apply -f ftest-de.yaml
vi ftest-de.yaml
kubectl apply -f ftest-de.yaml
vi ftest-de.yaml
kubectl apply -f ftest-de.yaml
vi ftest-de.yaml
kubectl apply -f ftest-de.yaml
vi ftest-de.yaml
kubectl apply -f ftest-de.yaml
vi ftest-de.yaml
kubectl apply -f ftest-de.yaml
vi ftest-de.yaml
kubectl apply -f ftest-de.yaml
vi ftest-de.yaml
vi ftest-svc.yaml
kubectl apply -f ftest-de.yaml
kubectl apply -f ftest-svc.yaml
kubectl apply -f ftest-in.yaml
vi ftest-in.yaml
vi btest-de.yaml
vi btest-svc.yaml
vi stest-de.yaml
vi stest-svvc.yaml
kubectl apply -f btest-de.yaml
kubectl apply -f btest-svc.yaml
kubectl apply -f stest-svc.yaml
kubectl apply -f stest-de.yaml
kubectl apply -f stest-svvc.yaml
kubectl get all
vi frontend-ingress.yaml
vi ftest-de.yaml 
vi ftest-svc.yaml 
kubectl get all
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get po -n argocd  -w
kubectl get secret -n argocd argocd-initial-admin-secret
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
watch kubectl get all --namespace argocd
kubectl port-forward --address=0.0.0.0 svc/argocd-server -n argocd 8080:443
kubectl get pod
lsof -i:8080
kubectl port-forward --address=0.0.0.0 svc/argocd-server -n argocd 8080:443
watch kubectl get all --namespace argocd
kubectl port-forward svc/argocd-server -n argocd 8080:443
watch kubectl get all --namespace argocd
kubectl port-forward 172.0.0.1 svc/argocd-server -n argocd 8080:443
kubectl port-forward 127.0.0.1 svc/argocd-server -n argocd 8080:443
kubectl describe pod demo-flask-backend-6d79d6fc87-4fr6n
kubectl get po -n argocd
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get po -n argocd
kubectl port-forward svc/argocd-server -n argocd 8080:443
yum install argocd
brew install argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.11.8/manifests/install.yaml
watch kubectl get all --namespace argocd
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl get po -n argocd
argocd admin initial-password -n argocd
k -n argocd get po
kubectl -n argocd get po
kubectl namespaces
kubectl get nd
kubectl get ns
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubeget all -n argo
export ARGOCD_SERVER=`kubectl get svc argocd-server -n argocd -o json | jq --raw-output .status.loadBalancer.ingress[0].hostname`
echo $ARGOCD_SERVER
kubectl get po -n argocd
kubectl get all -n argocd
kubectl get po -n argocd
kubectl describe nodes
ipconfig
ifconfig
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get po -n argocd
git config user.name
ls
cd mid1
ls
cd ../manifests/
ls
cd alb-ingress-controller/
ls
i frontend-ingress.yaml 
vi frontend-ingress.yaml 
vi frontend-service.yaml 
vi frontend-deploymentyaml 
vi frontend-deployment.yaml 
vi ftest-de.yaml 
vi ftest-in.yaml 
vi ftest-svc.yaml 
cd ..
ls
cd ..
ls
vi eks-demo-cluster.yaml 
vi nginx-service.taml
vi nginx-service.yaml
vi nginx-service1.yaml
cd manifests
ls
cd alb-ingress-controller/
ls
cd btest-de.yaml
vi btest-de.yaml
vi btest-svc.yaml
vi frontend-deployment.yaml 
vi ftest-de.yaml 
docker image
docker images
docker ps
vi v2_5_4_full.taml
vi v2_5_4_full.yaml
ls
vi v2_5_4_ingclass.yaml
vi frontend-deployment.yaml 
vi ftest-in.yaml 
kubectl -n argocd get po
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd admin initial-password -n argocd
ARGO_PWD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
echo $ARGO_PWD
kubectl port-forward svc/argocd-server -n argocd 8080:443
