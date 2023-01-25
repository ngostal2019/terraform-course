# Below are the terraform commands to intract with the state file

```hcl
1. Shows the remote or the local plan/state file
  terraform show

2. Updates the state file with the real infrastructure manual changes
  terraform refresh

3. Lists all the resources found in the state file
  terraform state list

4. Rename a resource | moves items from a state file to another one | use it with -dry-run for test
  terraform state mv <src> <dest>

5. Remove the desired resource from the state file
  terraform state rm <resource_name>

6. Used to replace the terraform provider by a new one
  terraform replace-provider <old_provider> <new_provider>

7. For disaster recovery, pull download and out the remote state file to local
  terraform state pull

8. For disaster recovery, push pushes update from local to the remote state file
  terraform state push

9. Applies destroy and then create replacement of a resource
  terraform taint <resource_name>

10. Forces a resource instance to be untainted
  terraform untaint <resource_name>

11. Shows the attributes of a single resource found in the state file
  terraform state show <resource_name>

12. This commands will target a specific resource to apply the changes and will ignore other changes in the manifest file
  terraform plan/apply -target=<resource_name>
```
