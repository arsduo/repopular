class Repo < ActiveRecord::Base
  attr_accessible :full_name, :name, :user_id

  # gh - an authenticated client
  # events - Array of events to subscribe to
  def create_hook(gh, *events)
    gh.post path("hooks"),
      name: "web",
      active: true,
      config: { url: ENV['WEBHOOK_URL'] },
      events: events.map(&:to_s)
  end

  def path(*subpath)
    (["repos", full_name] + subpath).join("/")
  end
end
