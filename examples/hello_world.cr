require "../src/adw"

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
count = 0

app.activate_signal.connect do
  window = Adw::ApplicationWindow.new(app)
  window.title = "Hello World!"
  window.set_default_size(200, 200)

  box = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
  header = Adw::HeaderBar.new

  button = Gtk::Button.new_with_label("Hello!!")
  button.clicked_signal.connect do
    count += 1
    button.label = "You clicked #{count} times!"
  end
  button.vexpand = true

  box.append(header)
  box.append(button)
  window.content = box
  window.present
end

exit(app.run(ARGV))
