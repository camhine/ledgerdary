dep 'nginx', :docroot, :site, :source do
  docroot.default '/var/www'

  requires 'nginx.bin'
  requires 'nginx config'.with(docroot: docroot, site: site, source: source)
end

dep 'nginx.bin' do
  installs 'nginx'
end

dep 'nginx config', :docroot, :site, :source do
  requires ('nginx link site').with(docroot: docroot, site: site, source: source)
  requires ('nginx site enabled').with(site: site)
  requires ('nginx default site disabled')

  meet { sudo 'service nginx restart' }
end

dep 'nginx link site', :docroot, :site, :source do
  def link
    "#{docroot}/#{site}"
  end

  requires ('nginx docroot').with(docroot: docroot)

  met? { link.p.exists? }

  meet { shell "ln -s #{source} #{link}"}
end

dep 'nginx docroot', :docroot do
  def owned_by_user?
    shell "stat -c %U #{docroot} | grep $USER"
  end

  met? { docroot.p.exists? && owned_by_user? }

  meet {
    sudo "mkdir -p #{docroot}"
    sudo "chown -R $USER:$USER #{docroot}"
  }
end

def available_site site
  "/etc/nginx/sites-available/#{site}"
end

def enabled_site site
  "/etc/nginx/sites-enabled/#{site}"
end

dep 'nginx site enabled', :site do
  requires ('nginx site available').with(site: site)

  met? { "#{enabled_site(site)}".p.exists? }

  meet { sudo "ln -s #{available_site(site)} #{enabled_site(site)}" }
end

dep 'nginx default site disabled' do
  met? { !"#{enabled_site("default")}".p.exists? }

  meet { sudo "rm #{enabled_site("default")}"}
end

dep 'nginx site available', :site do
  def babushka
    File.dirname(__FILE__)
  end

  def site_config
    available_site(site)
  end

  met? { site_config.p.exists? }

  meet { sudo "ln -s #{babushka}/files#{site_config} #{site_config}" }
end
