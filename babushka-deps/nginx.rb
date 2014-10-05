dep 'nginx' do
  requires 'nginx.bin'
end

dep 'nginx.bin' do
  installs 'nginx'
end
