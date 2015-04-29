# HelloWorld-cookbook

## Usage

### Deployment 
  - gem install knife-solo

  - Copy ssh key to host:/root/.ssh/authorized_keys

  - knife solo prepare root@host

  - Include `HelloWorld` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[HelloWorld::default]"
  ]
}
```

  - knife solo cook root@host

### Testing

  - bundle install

*Full integration test:*
  - kitchen test

*Converge test VM*:
  - kitchen converge

*Run serverspec tests on a converged node:*
  - kitchen verify

