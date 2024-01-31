# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

userLinks = User.create(username: 'userConLinks', email: 'userConLinks@gmail.com', password: '123456')
user2Links = User.create(username: 'user2ConLinks', email: 'user2ConLinks@gmail.com', password: '123456')
userSinLinks = User.create(username: 'userSinLinks', email: 'userSinLinks@gmail.com', password: '123456')


linkTwitter = RegularLink.create(
  name: 'Twitter',
  slug: SecureRandom.hex(4),
  url: 'https://twitter.com/',
  user_id: userLinks.id
)

linkGPT = RegularLink.create(
  name: 'ChatGPT',
  slug: SecureRandom.hex(4),
  url: 'https://chat.openai.com/',
  user_id: userLinks.id
)

linkIg = PrivateLink.create(
    name: 'Instagram Messi',
    slug: SecureRandom.hex(4),
    url: 'instagram.com/leomessi',
    user_id: userLinks.id,
    password: '1234'
)

linkRuby = TemporalLink.create(
    name: 'Ruby',
    slug: SecureRandom.hex(4),
    url: 'https://rubygems.org/',
    user_id: userLinks.id,
    expiration_date: Time.now + 3.days
)

linkRubyExpired = TemporalLink.create(
    name: 'Ruby Expirado',
    slug: SecureRandom.hex(4),
    url: 'https://rubygems.org/',
    user_id: userLinks.id,
    expiration_date: Time.now - 3.days
)

linkGit = OneTimeLink.create(
    name: 'Git',
    slug: SecureRandom.hex(4),
    url: 'github.com/gianquaranta/chq_to/',
    user_id: user2Links.id
)

linkGit2 = OneTimeLink.create(
    name: 'Git - ya accedido',
    slug: SecureRandom.hex(4),
    url: 'github.com/gianquaranta/chq_to/',
    user_id: userLinks.id
)


LinkAccess.create(link_id: linkTwitter.id, created_at: Time.now - 4.days, ip: '127.0.0.1')
LinkAccess.create(link_id: linkTwitter.id, created_at: Time.now - 3.days, ip: '192.168.1.1')
LinkAccess.create(link_id: linkTwitter.id, created_at: Time.now - 8.days, ip: '156.191.63.181')
LinkAccess.create(link_id: linkTwitter.id, created_at: Time.now - 6.days, ip: '102.114.27.165')
LinkAccess.create(link_id: linkTwitter.id, created_at: Time.now - 1.day, ip: '134.208.29.112')
LinkAccess.create(link_id: linkTwitter.id, created_at: Time.now - 3.days, ip: '186.198.14.32')
LinkAccess.create(link_id: linkTwitter.id, created_at: Time.now - 5.days, ip: '202.168.46.252')
LinkAccess.create(link_id: linkIg.id, created_at: Time.now - 12.days, ip: '162.138.92.124')
LinkAccess.create(link_id: linkIg.id, created_at: Time.now - 7.days, ip: '212.190.214.35')
LinkAccess.create(link_id: linkRubyExpired.id, created_at: Time.now - 2.days, ip: '156.204.98.112')
LinkAccess.create(link_id: linkRubyExpired.id, created_at: Time.now - 14.days, ip: '208.26.154.36')
LinkAccess.create(link_id: linkGit2.id, created_at: Time.now - 7.days, ip: '176.35.192.10')
