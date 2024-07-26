aws_region = os.getenv("AWS_REGION", "")
aws_account_id = os.getenv("AWS_ACCOUNT_ID", "")
cluster_name = os.getenv("CLUSTER_NAME", "")
ecr_repository = aws_account_id + '.dkr.ecr.' + aws_region + '.amazonaws.com'

allow_k8s_contexts("arn:aws:eks:" + aws_region + ":" + aws_account_id + ":cluster/" + cluster_name)
default_registry(ecr_repository)

local_resource("frontend-ecr", ["./hack/create-ecr-repository.sh", "frontend"])
include("../frontend/Tiltfile")

local_resource("ad-ecr", ["./hack/create-ecr-repository.sh",  "adservice"])
include("../ad/Tiltfile")

local_resource("email-ecr", ["./hack/create-ecr-repository.sh",  "emailservice"])
include("../email/Tiltfile")

local_resource("productcatalog-ecr", ["./hack/create-ecr-repository.sh",  "productcatalogservice"])
include("../productcatalog/Tiltfile")

local_resource("recommendation-ecr", ["./hack/create-ecr-repository.sh",  "recommendationservice"])
include("../recommendation/Tiltfile")

local_resource("shipping-ecr", ["./hack/create-ecr-repository.sh",  "shippingservice"])
include("../shipping/Tiltfile")

local_resource("checkout-ecr", ["./hack/create-ecr-repository.sh",  "checkoutservice"])
include("../checkout/Tiltfile")

local_resource("payment-ecr", ["./hack/create-ecr-repository.sh",  "paymentservice"])
include("../payment/Tiltfile")

local_resource("currency-ecr", ["./hack/create-ecr-repository.sh",  "currencyservice"])
include("../currency/Tiltfile")

local_resource("cart-ecr", ["./hack/create-ecr-repository.sh",  "cartservice"])
include("../cart/Tiltfile")

k8s_yaml('./kubernetes-manifests/redis.yaml')
