module Gtk
  # The `GtkActionable` interface provides a convenient way of asscociating
  # widgets with actions.
  #
  # It primarily consists of two properties: [property@Gtk.Actionable:action-name]
  # and [property@Gtk.Actionable:action-target]. There are also some convenience
  # APIs for setting these properties.
  #
  # The action will be looked up in action groups that are found among
  # the widgets ancestors. Most commonly, these will be the actions with
  # the “win.” or “app.” prefix that are associated with the
  # `GtkApplicationWindow` or `GtkApplication`, but other action groups that
  # are added with `Gtk::Widget#insert_action_group` will be consulted
  # as well.
  module Actionable
    def action_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "action-name", unsafe_value, Pointer(Void).null)
      value
    end

    def action_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "action-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def action_target=(value : GLib::Variant?) : GLib::Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "action-target", unsafe_value, Pointer(Void).null)
      value
    end

    def action_target : GLib::Variant?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "action-target", pointerof(value), Pointer(Void).null)
      GLib::Variant.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def action_name : ::String?
      # gtk_actionable_get_action_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_actionable_get_action_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def action_target_value : GLib::Variant?
      # gtk_actionable_get_action_target_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_actionable_get_action_target_value(@pointer)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def action_name=(action_name : ::String?) : Nil
      # gtk_actionable_set_action_name: (Method | Setter)
      # @action_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      action_name = if action_name.nil?
                      Pointer(LibC::Char).null
                    else
                      action_name.to_unsafe
                    end

      # C call
      LibGtk.gtk_actionable_set_action_name(@pointer, action_name)

      # Return value handling
    end

    def action_target_value=(target_value : _?) : Nil
      # gtk_actionable_set_action_target_value: (Method)
      # @target_value: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      target_value = if target_value.nil?
                       Pointer(Void).null
                     elsif !target_value.is_a?(GLib::Variant)
                       GLib::Variant.new(target_value).to_unsafe
                     else
                       target_value.to_unsafe
                     end

      # C call
      LibGtk.gtk_actionable_set_action_target_value(@pointer, target_value)

      # Return value handling
    end

    def detailed_action_name=(detailed_action_name : ::String) : Nil
      # gtk_actionable_set_detailed_action_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_actionable_set_detailed_action_name(@pointer, detailed_action_name)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractActionable < GObject::Object
    include Actionable

    GICrystal.define_new_method(Gtk::AbstractActionable, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_actionable_get_type
    end

    # Cast a `GObject::Object` to `Actionable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Actionable")
    end

    # Cast a `GObject::Object` to `Actionable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
