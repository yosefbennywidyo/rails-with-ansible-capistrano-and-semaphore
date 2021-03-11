# Ansible
[Ansible documentation](https://docs.ansible.com/)

## Ping Ansible
```bash
ansible -i ansible/inventory.yml -m ping yosefbennywidyo_digital_ocean
```

## Run Ansible
```bash
ansible-playbook -i ansible/inventory.yml ansible/site.yml
```

### Debugging
add `-vvvv` to ansible command, sample:
```bash
ansible-playbook -i ansible/inventory.yml ansible/site.yml -vvvv
```