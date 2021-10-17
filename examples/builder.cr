require "../src/libadwaita"

UI = <<-EOT
<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <requires lib="gtk" version="4.0"/>
  <object class="GtkBox" id="root">
    <property name="can-focus">0</property>
    <property name="orientation">vertical</property>
      <child>
        <object class="GtkHeaderBar"/>
      </child>
      <child>
        <object class="GtkLabel">
          <property name="can-focus">0</property>
          <property name="label" translatable="yes">Hope someone add GTK4
support to glade soon</property>
          <property name="justify">right</property>
        </object>
      </child>
  </object>
</interface>
EOT

def activate(app : Adw::Application)
  window = Adw::ApplicationWindow.new(app)
  window.title = "Gtk Builder"
  window.set_default_size(200, 200)
  # header = Adw::HeaderBar.new

  builder = Gtk::Builder.new_from_string(UI, UI.bytesize.to_i64)
  root = Gtk::Widget.cast(builder["root"])

  window.content = root
  window.present
end

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Adw::Application))
exit(app.run(ARGV))
