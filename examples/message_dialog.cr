require "../src/adw"

def activate(app : Adw::Application)
  window = Adw::ApplicationWindow.new(app)
  window.set_default_size(200, 200)
  window.title = "Message Box"

  box = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
  header = Adw::HeaderBar.new
  label = Gtk::Label.new

  box.append(header)
  box.append(label)
  window.content = box

  Gtk::MessageDialog.yes_no(transient_for: window, message_type: :info, title: "Title", text: "😎️") do |response|
    response = Gtk::ResponseType.from_value(response)
    label.text = response.inspect
    next if response.no?

    Gtk::MessageDialog.ok_cancel(transient_for: window, message_type: :info, title: "Title", text: "😁️") do |response|
      response = Gtk::ResponseType.from_value(response)
      label.text = response.inspect
      next if response.cancel?

      Gtk::MessageDialog.ok(transient_for: window, message_type: :info, title: "Title", text: "🤓️") do |response|
        label.text = Gtk::ResponseType.from_value(response).inspect

        Gtk::MessageDialog.close(transient_for: window, message_type: :info, title: "Title", text: "😵‍💫️") do |response|
          label.text = Gtk::ResponseType.from_value(response).inspect

          Gtk::MessageDialog.cancel(transient_for: window, message_type: :info, title: "Title", text: "😅️") do |response|
            label.text = Gtk::ResponseType.from_value(response).inspect
          end
        end
      end
    end
  end

  window.present
end

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Adw::Application))
exit(app.run(ARGV))
