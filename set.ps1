Import-Module ControlSshConfig
Import-Module Git
Import-Module GitBranches
Import-Module Projects
Import-Module Settings


# 0. ���������������            -- ����
# 1. Git

  # 1.1 �������� �������

    # 1.1.1 - ������������� ������� �����������     -- g
    # 1.1.2 - ���������� � ������ (������������)    -- ga
    # 1.1.3 - ���������� ������                     -- gcmt $args           (gcmt, gcmt "New commit")
    
  # 1.1 - ������ ������������� ����                 -- init <���_����>
  # 1.2 - ������ �����������                        -- gs
  # 1.4 Git - ������ � �������
    # 1.4.1 - ������ �����                          -- gb $args
    # 1.4.2 - ������������ ����� �������,           -- ch <�����>
              # ����� ������                        -- ch <����> ��� <�����>

# 2. ������ � ��������
  # 2.1 - ��������� �������                         -- eba
  # 2.2 - ��������� �������                         -- pd

# 3. NPM
  # 3.1  - ��������� ������������    -- i
    #    - ��������� ������          -- i <���_������>
# 4. YARN
# 5. �������
# 6. ������ � ����������
# 7. SSH
  # 7.1 - ������ � ssh �������
    # 7.1.1 - �������� ����                       -- key
    # 7.1.2 - ����������� ���� � ����� ������     -- getkey  
  # 7.2 - SSH �����
    # 7.2.1 - ����������� � big                   -- big
    # 7.2.2 - ����������� � dev                   -- dev
# 8. �������


# 0. ���������������
  
  function Get-WhoMe { Write-Host -ForegroundColor DarkGreen "�� ������ ��������, �� ������ ���� � ����!"}
  Set-Alias '����' Get-WhoMe



    

    



  
  
  
  

 

  function Get-GitCommitFix { & git commit -m "fix: update"}

  function Get-Pull { & git pull }

  # Git - ������������ �������

    function Get-Push { Get-GitAdd; & git commit -m 'update'; Get-Gpu; }
    function Get-Push2{ Get-GitAdd; Get-GitCommitFix; Get-Gpu;}
    function Get-PushUOriginMaster { & git push -u origin master }



# 2. ������ � ��������

 

  # 2.2 - ���������� �������

    function Get-PullAliases {set-location "C:/proj/settings";git pull;}
    Set-Alias 'pd' Get-PullAliases

  # 2.3 - ���������� �������

    function Get-UpdateAliases {set-location "C:/proj/settings";p;}
    Set-Alias 'ud' Get-UpdateAliases    # ���������� �������




function Get-GoPma { & code c:/proj/phpmyadmin }



# 3. NPM

  # 3.1 - npm install

    function Get-NpmInstall { & npm install $args}
    Set-Alias 'i' Get-NpmInstall      

  # 3.2 - Set-Alias 'rs' Get-NpmRunStart    # npm run start
  function Get-NpmRunStart { & npm run start}

Set-Alias 's' Get-Start           # npm run start
Set-Alias 'sw' Get-StartWatch     # npm run start:watch
Set-Alias 'b' Get-Build           # npm run build:prod 

# Yarn

Set-Alias 'y' Get-Yarn          # yarn
Set-Alias 'sd' Get-StartDev     # yarn start:dev
Set-Alias 'yb' Get-YarnBuild    # yarn build


function Get-Build { & npm run build:prod }

function Get-Start { & npm run start }
function Get-StartWatch { & npm run start:watch }


#

function Get-Web { set-location "C:/proj/web" }

# Yarn
function Get-Yarn { & yarn }
function Get-StartDev { & yarn start:dev }
function Get-YarnBuild { yarn build }



# go.ams74.ru

function Get-SendMaster{ & ssh master 'cd /var/projects/go/www/go.ams74.ru && git pull origin php8.1'}
function Get-Auto { Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendMaster; }

# dev.ams74.ru
function Get-SendDev{ & ssh master 'cd /var/projects/go/www/dev.go.ams74.ru && git pull origin php8.1'}
function Get-AutoDev{ Get-GitAdd; Get-GitCommit; Get-Gpu; Get-SendDev; }

# Nestjs.ru

function Get-Docs { & npm run docs}
function Get-GitDist { & git subtree split --branch dist --prefix dist/ }

# ������ � ����������



function Get-Proj { set-location "C:/proj" }
function Get-Go { 
  if($args[0] -eq 'proj'){
    set-location "C:/proj" 
  }elseif($args[0] -eq 'ssh'){
    set-location "~/.ssh" 
  }elseif($args[0] -eq 'docker'){
    set-location "C:/docker"
  }

}


function Get-Dev { ssh dev }
function Get-React { ssh react }
function Get-ZTV { ssh ztv}
function Get-Config { & code c:/users/ameon/.ssh/config}
function ssh_copy_id([string]$sshHost)
{
    cat ~/.ssh/id_rsa.pub | ssh "$sshHost" "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

# 6. ������ � ����������

  # 6.1 - ������� ���������
  
    Set-Alias 'c' cls
    Set-Alias '�' cls

  # 6.2 - ������� ���� ��� ��������������
  
    function Get-EditFile {
      if($args[0] -eq 'config'){
        code $env:userprofile/.ssh/config
      }
    }
    Set-Alias 'e' Get-EditFile        

  # 6.3 - ������ ������ ���������

    function Get-La { ls | ft -p name}
    Set-Alias 'la' Get-La

  # 6.4 - ������� � �������� ����� ������������

    Set-Alias 'home' Get-Home
    
    function Get-Master { ssh master }
    Set-Alias 'master' Get-Master     # ssh master

    function Get-Vpn { ssh vpn }
    Set-Alias 'vpn' Get-Vpn

  Set-Alias 'dev' Get-Dev           # ssh dev
  Set-Alias 'proj' Get-Proj
  Set-Alias 'react' Get-React       # ssh react
  Set-Alias 'ztv' Get-ZTV           # ssh ztv
  Set-Alias 'config' Get-Config
  Set-Alias 'web' Get-Web
  Set-Alias 'go' Get-Go             # ������� � �����  
  
# 7. SSH

  # 7.1 - ������ � ssh �������

    # 7.1.1 - �������� ���� 

      function Get-ShowKey { cat ~/.ssh/id_rsa.pub }
      Set-Alias 'key' Get-ShowKey

    # 7.1.2 - ����������� ���� � ����� ������

      function Get-Key {$res = cat ~/.ssh/id_rsa.pub;Set-Clipboard $res}
      Set-Alias 'getkey' Get-Key

  # 7.2 - SSH �����

    # 7.2.1 - ������������ � big

      function Get-Big { ssh big }
      Set-Alias 'big' Get-Big

    # 7.2.2 - ������������ � dev

      function Get-Dev { ssh dev }
      Set-Alias 'dev' Get-Dev

  # SSH �����

    




  # 7.1 - ������ � ssh �������

    
    

  
  

  




















Set-Alias 'pma' Get-StartPhpMyadmin

Set-Alias 'push' Get-Push
Set-Alias 'push2' Get-Push2

# Git








Set-Alias 'p' Get-Push                    # ga gcmt p
Set-Alias 'p2' Get-Push2
Set-Alias 'pl' Get-Pull                   # git pull
Set-Alias 'puom' Get-PushUOriginMaster    # git push -u origin master









Set-Alias 'homj' Get-Homj
Set-Alias 'oldgo' Get-StartOldGo
Set-Alias 'gopma' Get-GoPma
Set-Alias 'gol' Get-StartGoLoc
Set-Alias 'gou' Get-StartGoUpdate


# Nestjs.ru
Set-Alias 'dist' Get-GitDist    # git subtree split --branch dist --prefix dist/
Set-Alias 'docs' Get-Docs       # npm run docs

# go.ams74.ru
Set-Alias 'a' Get-Auto            # ������� � master


# dev.go.ams74.ru
Set-Alias 'adev' Get-AutoDev



