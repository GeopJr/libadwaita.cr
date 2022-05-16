require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that invokes a callback.
  @[GObject::GeneratedWrapper]
  class CallbackAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CallbackActionClass), class_init,
        sizeof(LibGtk::CallbackAction), instance_init, 0)
    end

    GICrystal.define_new_method(CallbackAction, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CallbackAction`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_callback_action_get_type
    end

    # Create a custom action that calls the given @callback when
    # activated.
    def initialize(callback : Gtk::ShortcutFunc?)
      # gtk_callback_action_new: (Constructor)
      # @callback: (nullable)
      # @data: (nullable)
      # Returns: (transfer full)

      # Generator::CallbackArgPlan
      if callback
        _box = ::Box.box(callback)
        callback = ->(lib_widget : Pointer(Void), lib_args : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          widget = Gtk::Widget.new(lib_widget, :none)
          # Generator::HandmadeArgPlan
          args = GLib::Variant.new(lib_args, :none)
          ::Box(Proc(Gtk::Widget, GLib::Variant?, Bool)).unbox(lib_user_data).call(widget, args)
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        callback = data = destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_callback_action_new(callback, data, destroy)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
