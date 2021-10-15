require "../src/adw"

def activate(app : Adw::Application)
  window = Adw::ApplicationWindow.new(app)
  window.title = "TreeView"
  window.set_default_size(200, 200)

  builder = Gtk::Builder.new_from_file("#{__DIR__}/tree_view.ui")
  model = Gtk::TreeStore.cast(builder["tree_model"])
  label = Gtk::Label.cast(builder["label"])
  box = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
  header = Adw::HeaderBar.new
  fill_model(model)

  view = Gtk::TreeView.cast(builder["tree_view"])
  view.row_activated_signal.connect do |path, column|
    iter = model.iter(path)

    value = model.value(iter, 0)
    label.text = "You Clicked on #{value.as_s}"
  end

  box.append(header)
  box.append(Gtk::Widget.cast(builder["root"]))
  window.content = box
  window.present
end

def fill_model(model)
  root = model.append(nil)
  model.set(root, {0}, {"Root"})
  child = model.append(root)
  model.set(child, {0}, {"Child!"})
end

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Adw::Application))
exit(app.run(ARGV))
