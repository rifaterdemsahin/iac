dotnet msbuild $(Pipeline.Workspace)/build/pipelines/workload/msbuild/database1.sqlproj /t:Build /t:Publish /p:SqlPublishProfilePath="$(Pipeline.Workspace)/build/pipelines/workload/msbuild/sqlazure.publish.xml"

msbuild Database1.sqlproj /t:SqlPublish /p:SqlPublishProfilePath="sqlazure.publish.xml"

dotnet msbuild /t:Build /t:Publish /p:SqlPublishProfilePath="Tools\Deployment Settings\MyDatabase.Dev.publish.xml"