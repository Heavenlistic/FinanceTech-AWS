To deploy 4 resources (ECS instance, S3 bucket, S3 bucket ACL, S3 bucket ownership controls) in AWS using terraform

In main.tf - the resource names, the correct AMI and the location were updated

# Commands in the terminal for main folder path
1. touch Readme.md .gitignore > 
2. aws configure > Press Enter 4x > clear > aws sts get-caller-identity  > Clear
3. terraform init > terraform plan > terraform apply > terraform destroy
4. git init > git add .gitignore > git status > git commit -m "Initial push" > git add . > git commit -m "Initial push" (first delete all previous .git folders to avoid error)
5. git remote add origin (git link) 
    git branch -M main 
    git push -u origin main. 
6. git add . > git commit -m "Second push" > git push (for additional changes with updated comments)