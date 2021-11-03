module Gtk
  # `GtkAccessible` is an interface for describing UI elements for
  # Assistive Technologies.
  #
  # Every accessible implementation has:
  #
  #  - a “role”, represented by a value of the [enum@Gtk.AccessibleRole] enumeration
  #  - an “attribute”, represented by a set of [enum@Gtk.AccessibleState],
  #    [enum@Gtk.AccessibleProperty] and [enum@Gtk.AccessibleRelation] values
  #
  # The role cannot be changed after instantiating a `GtkAccessible`
  # implementation.
  #
  # The attributes are updated every time a UI element's state changes in
  # a way that should be reflected by assistive technologies. For instance,
  # if a `GtkWidget` visibility changes, the %GTK_ACCESSIBLE_STATE_HIDDEN
  # state will also change to reflect the [property@Gtk.Widget:visible] property.
  module Accessible
    def accessible_role=(value : Gtk::AccessibleRole) : Gtk::AccessibleRole
      unsafe_value = value

      LibGObject.g_object_set(self, "accessible-role", unsafe_value, Pointer(Void).null)
      value
    end

    def accessible_role : Gtk::AccessibleRole
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "accessible-role", pointerof(value), Pointer(Void).null)
      Gtk::AccessibleRole.from_value(value)
    end

    def accessible_role : Gtk::AccessibleRole
      # gtk_accessible_get_accessible_role: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_accessible_get_accessible_role(self)
      Gtk::AccessibleRole.from_value(_retval)
    end

    def reset_property(property : Gtk::AccessibleProperty) : Nil
      # gtk_accessible_reset_property: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_accessible_reset_property(self, property)
    end

    def reset_relation(relation : Gtk::AccessibleRelation) : Nil
      # gtk_accessible_reset_relation: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_accessible_reset_relation(self, relation)
    end

    def reset_state(state : Gtk::AccessibleState) : Nil
      # gtk_accessible_reset_state: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_accessible_reset_state(self, state)
    end

    def update_property(properties : Enumerable(Gtk::AccessibleProperty), values : Enumerable(_)) : Nil
      # gtk_accessible_update_property_value: (Method)
      # @properties: (array length=n_properties element-type Interface)
      # @values: (array length=n_properties element-type Interface)
      # Returns: (transfer none)

      n_properties = properties.size
      n_properties = values.size
      properties = properties.to_a.map(&.to_unsafe).to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      LibGtk.gtk_accessible_update_property_value(self, n_properties, properties, values)
    end

    def update_relation(relations : Enumerable(Gtk::AccessibleRelation), values : Enumerable(_)) : Nil
      # gtk_accessible_update_relation_value: (Method)
      # @relations: (array length=n_relations element-type Interface)
      # @values: (array length=n_relations element-type Interface)
      # Returns: (transfer none)

      n_relations = relations.size
      n_relations = values.size
      relations = relations.to_a.map(&.to_unsafe).to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      LibGtk.gtk_accessible_update_relation_value(self, n_relations, relations, values)
    end

    def update_state(states : Enumerable(Gtk::AccessibleState), values : Enumerable(_)) : Nil
      # gtk_accessible_update_state_value: (Method)
      # @states: (array length=n_states element-type Interface)
      # @values: (array length=n_states element-type Interface)
      # Returns: (transfer none)

      n_states = states.size
      n_states = values.size
      states = states.to_a.map(&.to_unsafe).to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      LibGtk.gtk_accessible_update_state_value(self, n_states, states, values)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Accessible__Impl
    include Accessible

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_accessible_get_type
    end

    # Cast a `GObject::Object` to `Accessible`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Accessible")
    end

    # Cast a `GObject::Object` to `Accessible`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
