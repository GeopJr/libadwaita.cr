require "../g_object-2.0/object"

module Gtk
  # A `GtkListItemFactory` creates widgets for the items taken from a `GListModel`.
  #
  # This is one of the core concepts of handling list widgets such
  # as `Gtk#ListView` or `Gtk#GridView`.
  #
  # The `GtkListItemFactory` is tasked with creating widgets for items
  # taken from the model when the views need them and updating them as
  # the items displayed by the view change.
  #
  # A view is usually only able to display anything after both a factory
  # and a model have been set on the view. So it is important that you do
  # not skip this step when setting up your first view.
  #
  # Because views do not display the whole list at once but only a few
  # items, they only need to maintain a few widgets at a time. They will
  # instruct the `GtkListItemFactory` to create these widgets and bind them
  # to the items that are currently displayed.
  #
  # As the list model changes or the user scrolls to the list, the items will
  # change and the view will instruct the factory to bind the widgets to those
  # new items.
  #
  # The actual widgets used for displaying those widgets is provided by you.
  #
  # When the factory needs widgets created, it will create a `GtkListItem`
  # and hand it to your code to set up a widget for. This list item will provide
  # various properties with information about what item to display and provide
  # you with some opportunities to configure its behavior. See the
  # `Gtk#ListItem` documentation for further details.
  #
  # Various implementations of `GtkListItemFactory` exist to allow you different
  # ways to provide those widgets. The most common implementations are
  # `Gtk#BuilderListItemFactory` which takes a `GtkBuilder` .ui file
  # and then creates widgets and manages everything automatically from the
  # information in that file and `Gtk#SignalListItemFactory` which allows
  # you to connect to signals with your own code and retain full control over
  # how the widgets are setup and managed.
  #
  # A `GtkListItemFactory` is supposed to be final - that means its behavior should
  # not change and the first widget created from it should behave the same way as
  # the last widget created from it.
  # If you intend to do changes to the behavior, it is recommended that you create
  # a new `GtkListItemFactory` which will allow the views to recreate its widgets.
  #
  # Once you have chosen your factory and created it, you need to set it
  # on the view widget you want to use it with, such as via
  # `Gtk::ListView#factory=`. Reusing factories across different
  # views is allowed, but very uncommon.
  @[GObject::GeneratedWrapper]
  class ListItemFactory < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ListItemFactoryClass), class_init,
        sizeof(LibGtk::ListItemFactory), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_list_item_factory_get_type
    end
  end
end
