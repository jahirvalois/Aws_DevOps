#check aws cli version
aws --version

aws configure
aws configure get region
aws configure get aws_access_key_id
aws configure get aws_secret_access_key

aws iam 
aws iam list-users
aws --endpoint http://aws:4566 iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --user-name mary
aws --endpoint http://aws:4566 iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --group-name mary
aws --endpoint http://aws:4566 iam list-users
aws --endpoint http://aws:4566 iam list-user-policies --user-name XXXXXXXX
aws --endpoint http://aws:4566 iam list-group-policies --group-name XXXXXXXX
aws --endpoint http://aws:4566 iam create-user --user-name XXXXXXXX
aws --endpoint http://aws:4566 iam create-group --group-name XXXXXXXX
aws --endpoint http://aws:4566 iam add-user-to-group --user-name XXXX --group-name XXXX


aws --endpoint http://aws:4566 ec2 describe-instances --image-id ami-082b3eca746b12a89 --instance-type t2.large --key-name jade


aws s3 cp imagetest.jpeg s3://s3bucketproject1
aws s3 ls s3://s3bucketproject1

curl -o imagetest.jpeg https://www.gvme.org/pages/get_image_large.php?id=1442



cd /home/ec2-user/
vim crearachivokey.pem
chmod 400 crearachivokey.pem
ssh ec2-user@1.0.0.0 -i crearachivokey.pem