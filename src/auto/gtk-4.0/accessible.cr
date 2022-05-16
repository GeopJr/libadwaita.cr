module Gtk
  # `GtkAccessible` is an interface for describing UI elements for
  # Assistive Technologies.
  #
  # Every accessible implementation has:
  #
  #  - a “role”, represented by a value of the `Gtk#AccessibleRole` enumeration
  #  - an “attribute”, represented by a set of `Gtk#AccessibleState`,
  #    `Gtk#AccessibleProperty` and `Gtk#AccessibleRelation` values
  #
  # The role cannot be changed after instantiating a `GtkAccessible`
  # implementation.
  #
  # The attributes are updated every time a UI element's state changes in
  # a way that should be reflected by assistive technologies. For instance,
  # if a `GtkWidget` visibility changes, the %GTK_ACCESSIBLE_STATE_HIDDEN
  # state will also change to reflect the `Gtk::Widget#visible` property.
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
      Gtk::AccessibleRole.new(value)
    end

    def accessible_role : Gtk::AccessibleRole
      # gtk_accessible_get_accessible_role: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_accessible_get_accessible_role(@pointer)

      # Return value handling

      Gtk::AccessibleRole.new(_retval)
    end

    def reset_property(property : Gtk::AccessibleProperty) : Nil
      # gtk_accessible_reset_property: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_accessible_reset_property(@pointer, property)

      # Return value handling
    end

    def reset_relation(relation : Gtk::AccessibleRelation) : Nil
      # gtk_accessible_reset_relation: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_accessible_reset_relation(@pointer, relation)

      # Return value handling
    end

    def reset_state(state : Gtk::AccessibleState) : Nil
      # gtk_accessible_reset_state: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_accessible_reset_state(@pointer, state)

      # Return value handling
    end

    def update_property(properties : Enumerable(Gtk::AccessibleProperty), values : Enumerable(_)) : Nil
      # gtk_accessible_update_property_value: (Method)
      # @properties: (array length=n_properties element-type Interface)
      # @values: (array length=n_properties element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_properties = properties.size # Generator::ArrayArgPlan
      properties = properties.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayLengthArgPlan
      n_properties = values.size # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_accessible_update_property_value(@pointer, n_properties, properties, values)

      # Return value handling
    end

    def update_relation(relations : Enumerable(Gtk::AccessibleRelation), values : Enumerable(_)) : Nil
      # gtk_accessible_update_relation_value: (Method)
      # @relations: (array length=n_relations element-type Interface)
      # @values: (array length=n_relations element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_relations = relations.size # Generator::ArrayArgPlan
      relations = relations.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayLengthArgPlan
      n_relations = values.size # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_accessible_update_relation_value(@pointer, n_relations, relations, values)

      # Return value handling
    end

    def update_state(states : Enumerable(Gtk::AccessibleState), values : Enumerable(_)) : Nil
      # gtk_accessible_update_state_value: (Method)
      # @states: (array length=n_states element-type Interface)
      # @values: (array length=n_states element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_states = states.size # Generator::ArrayArgPlan
      states = states.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayLengthArgPlan
      n_states = values.size # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_accessible_update_state_value(@pointer, n_states, states, values)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractAccessible < GObject::Object
    include Accessible

    GICrystal.define_new_method(Gtk::AbstractAccessible, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
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
