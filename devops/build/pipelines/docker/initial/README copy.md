To run managed dependencies from the YAML pipeline
https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops

Azure Issue
https://github.com/MicrosoftDocs/azure-docs/issues/82665

Local Testing
docker build --file dockerfile -t devopsrunner:11.0 .
 docker container run --env AZP_AGENT_NAME=pipelines-devops-docker --env AZP_POOL=Default --env AZP_TOKEN=hvofi3vs2thwvej737jyqrjomb3qbcrhpxu6ztmflooudvkogsoa --env AZP_URL="https://dev.azure.com/pexabo" --env AZP_WORK=_work --env DOCKER_BUILDKIT=1 --env imageName=pipelines-devops-docker -it --name devopsrun11 devopsrunner:11.0 

