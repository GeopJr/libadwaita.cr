require "../g_object-2.0/object"

module Gtk
  # `GtkConstraint` describes a constraint between attributes of two widgets,
  #  expressed as a linear equation.
  #
  # The typical equation for a constraint is:
  #
  # ```
  # target.target_attr = source.source_attr × multiplier + constant
  # ```
  #
  # Each `GtkConstraint` is part of a system that will be solved by a
  # `Gtk#ConstraintLayout` in order to allocate and position each
  # child widget or guide.
  #
  # The source and target, as well as their attributes, of a `GtkConstraint`
  # instance are immutable after creation.
  @[GObject::GeneratedWrapper]
  class Constraint < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ConstraintClass), class_init,
        sizeof(LibGtk::Constraint), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, constant : Float64? = nil, multiplier : Float64? = nil, relation : Gtk::ConstraintRelation? = nil, source : Gtk::ConstraintTarget? = nil, source_attribute : Gtk::ConstraintAttribute? = nil, strength : Int32? = nil, target : Gtk::ConstraintTarget? = nil, target_attribute : Gtk::ConstraintAttribute? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if !constant.nil?
        (_names.to_unsafe + _n).value = "constant".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, constant)
        _n += 1
      end
      if !multiplier.nil?
        (_names.to_unsafe + _n).value = "multiplier".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, multiplier)
        _n += 1
      end
      if !relation.nil?
        (_names.to_unsafe + _n).value = "relation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, relation)
        _n += 1
      end
      if !source.nil?
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end
      if !source_attribute.nil?
        (_names.to_unsafe + _n).value = "source-attribute".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source_attribute)
        _n += 1
      end
      if !strength.nil?
        (_names.to_unsafe + _n).value = "strength".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strength)
        _n += 1
      end
      if !target.nil?
        (_names.to_unsafe + _n).value = "target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target)
        _n += 1
      end
      if !target_attribute.nil?
        (_names.to_unsafe + _n).value = "target-attribute".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target_attribute)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Constraint.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_constraint_get_type
    end

    def constant=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "constant", unsafe_value, Pointer(Void).null)
      value
    end

    def constant : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "constant", pointerof(value), Pointer(Void).null)
      value
    end

    def multiplier=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "multiplier", unsafe_value, Pointer(Void).null)
      value
    end

    def multiplier : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "multiplier", pointerof(value), Pointer(Void).null)
      value
    end

    def relation=(value : Gtk::ConstraintRelation) : Gtk::ConstraintRelation
      unsafe_value = value

      LibGObject.g_object_set(self, "relation", unsafe_value, Pointer(Void).null)
      value
    end

    def relation : Gtk::ConstraintRelation
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "relation", pointerof(value), Pointer(Void).null)
      Gtk::ConstraintRelation.new(value)
    end

    def source=(value : Gtk::ConstraintTarget?) : Gtk::ConstraintTarget?
      unsafe_value = value

      LibGObject.g_object_set(self, "source", unsafe_value, Pointer(Void).null)
      value
    end

    def source : Gtk::ConstraintTarget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "source", pointerof(value), Pointer(Void).null)
      Gtk::ConstraintTarget__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def source_attribute=(value : Gtk::ConstraintAttribute) : Gtk::ConstraintAttribute
      unsafe_value = value

      LibGObject.g_object_set(self, "source-attribute", unsafe_value, Pointer(Void).null)
      value
    end

    def source_attribute : Gtk::ConstraintAttribute
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "source-attribute", pointerof(value), Pointer(Void).null)
      Gtk::ConstraintAttribute.new(value)
    end

    def strength=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "strength", unsafe_value, Pointer(Void).null)
      value
    end

    def strength : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "strength", pointerof(value), Pointer(Void).null)
      value
    end

    def target=(value : Gtk::ConstraintTarget?) : Gtk::ConstraintTarget?
      unsafe_value = value

      LibGObject.g_object_set(self, "target", unsafe_value, Pointer(Void).null)
      value
    end

    def target : Gtk::ConstraintTarget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "target", pointerof(value), Pointer(Void).null)
      Gtk::ConstraintTarget__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def target_attribute=(value : Gtk::ConstraintAttribute) : Gtk::ConstraintAttribute
      unsafe_value = value

      LibGObject.g_object_set(self, "target-attribute", unsafe_value, Pointer(Void).null)
      value
    end

    def target_attribute : Gtk::ConstraintAttribute
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "target-attribute", pointerof(value), Pointer(Void).null)
      Gtk::ConstraintAttribute.new(value)
    end

    # Creates a new constraint representing a relation between a layout
    # attribute on a source and a layout attribute on a target.
    def initialize(target : Gtk::ConstraintTarget?, target_attribute : Gtk::ConstraintAttribute, relation : Gtk::ConstraintRelation, source : Gtk::ConstraintTarget?, source_attribute : Gtk::ConstraintAttribute, multiplier : Float64, constant : Float64, strength : Int32)
      # gtk_constraint_new: (Constructor)
      # @target: (nullable)
      # @source: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end
      # Generator::NullableArrayPlan
      source = if source.nil?
                 Pointer(Void).null
               else
                 source.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_constraint_new(target, target_attribute, relation, source, source_attribute, multiplier, constant, strength)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new constraint representing a relation between a layout
    # attribute on a target and a constant value.
    def self.new_constant(target : Gtk::ConstraintTarget?, target_attribute : Gtk::ConstraintAttribute, relation : Gtk::ConstraintRelation, constant : Float64, strength : Int32) : self
      # gtk_constraint_new_constant: (Constructor)
      # @target: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_constraint_new_constant(target, target_attribute, relation, constant, strength)

      # Return value handling

      Gtk::Constraint.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the constant factor added to the source attributes' value.
    def constant : Float64
      # gtk_constraint_get_constant: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_constant(self)

      # Return value handling

      _retval
    end

    # Retrieves the multiplication factor applied to the source
    # attribute's value.
    def multiplier : Float64
      # gtk_constraint_get_multiplier: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_multiplier(self)

      # Return value handling

      _retval
    end

    # The order relation between the terms of the constraint.
    def relation : Gtk::ConstraintRelation
      # gtk_constraint_get_relation: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_relation(self)

      # Return value handling

      Gtk::ConstraintRelation.new(_retval)
    end

    # Retrieves the `Gtk#ConstraintTarget` used as the source for the
    # constraint.
    #
    # If the source is set to `NULL` at creation, the constraint will use
    # the widget using the `Gtk#ConstraintLayout` as the source.
    def source : Gtk::ConstraintTarget?
      # gtk_constraint_get_source: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_source(self)

      # Return value handling

      Gtk::ConstraintTarget__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the attribute of the source to be read by the constraint.
    def source_attribute : Gtk::ConstraintAttribute
      # gtk_constraint_get_source_attribute: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_source_attribute(self)

      # Return value handling

      Gtk::ConstraintAttribute.new(_retval)
    end

    # Retrieves the strength of the constraint.
    def strength : Int32
      # gtk_constraint_get_strength: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_strength(self)

      # Return value handling

      _retval
    end

    # Retrieves the `Gtk#ConstraintTarget` used as the target for
    # the constraint.
    #
    # If the targe is set to `NULL` at creation, the constraint will use
    # the widget using the `Gtk#ConstraintLayout` as the target.
    def target : Gtk::ConstraintTarget?
      # gtk_constraint_get_target: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_target(self)

      # Return value handling

      Gtk::ConstraintTarget__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the attribute of the target to be set by the constraint.
    def target_attribute : Gtk::ConstraintAttribute
      # gtk_constraint_get_target_attribute: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_get_target_attribute(self)

      # Return value handling

      Gtk::ConstraintAttribute.new(_retval)
    end

    # Checks whether the constraint is attached to a `Gtk#ConstraintLayout`,
    # and it is contributing to the layout.
    def is_attached : Bool
      # gtk_constraint_is_attached: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_is_attached(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks whether the constraint describes a relation between an attribute
    # on the `Gtk::Constraint#target` and a constant value.
    def is_constant : Bool
      # gtk_constraint_is_constant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_is_constant(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks whether the constraint is a required relation for solving the
    # constraint layout.
    def is_required : Bool
      # gtk_constraint_is_required: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_constraint_is_required(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
