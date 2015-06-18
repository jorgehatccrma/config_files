## kpcli setup

Notes on installing and configuring keepasscli (a.k.a. kpcli) on OS X 10.9 (mavericks)

data: May 2014


First, [download kpcli](http://kpcli.sourceforge.net/).
Once downloaded, put it in its final location (e.g. ~/):

    mv ~/Downloads/kpcli-2.5.pl ~/

Make it executable:

    chmod u+x kpcli-2.5.pl

Install perl dependencies via cpan

    sudo cpan Crypt::Rijndael
    sudo cpan Sort::Naturally
    sudo cpan Term::ShellUI
    sudo cpan File::KeePass

In theory that should be it, but there's a problem with `Term::readline`. To fix it follow the instructions [here](https://coderwall.com/p/kk0hqw)


Finally, you can make an alias to kpcli including the DB location for fast access. Add the following line to `~/.bash_profile`

    alias kp="/Users/myuser/kpcli-2.5.pl -kdb='/Users/myuser/mydb.kdbx'"
