# Welcome to dockermgr gitea installer 👋
  
## A community managed painless self-hosted Git service
  
### Requires scripts to be installed

```shell
 sudo bash -c "$(curl -LSs <https://github.com/dockermgr/installer/raw/main/install.sh>)"
 dockermgr --config && dockermgr install scripts  
```

#### Automatic install/update  

```shell
dockermgr install gitea
```


#### Manual install

```shell
git clone https://github.com/dockermgr/gitea "$HOME/.local/share/CasjaysDev/dockermgr/gitea"
bash -c "$HOME/.local/share/CasjaysDev/dockermgr/gitea/install.sh"
```
  
#### Just run it

```shell
mkdir -p "$HOME/.local/share/srv/docker/gitea/"

git clone <https://github.com/dockermgr/gitea> "$HOME/.local/share/CasjaysDev/dockermgr/gitea"

cp -Rfva "$HOME/.local/share/srv/docker/gitea/dataDir/." "$HOME/.local/share/srv/docker/gitea/"

sudo docker run -d \
--name="gitea" \
--hostname "gitea" \
--restart=unless-stopped \
--privileged \
-e TZ="${TZ:-${TIMEZONE:-America/New_York}}" \
-v "$HOME/.local/share/srv/docker/gitea/data":/data:z \
-v "$HOME/.local/share/srv/docker/gitea/config":/config:z \
-p PORT:INT_PORT \
TEMPLATE/TEMPLATE &>/dev/null
```

## Author  

👤 **Jason Hempstead**  
