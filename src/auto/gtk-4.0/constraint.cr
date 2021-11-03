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
  # [class@Gtk.ConstraintLayout] in order to allocate and position each
  # child widget or guide.
  #
  # The source and target, as well as their attributes, of a `GtkConstraint`
  # instance are immutable after creation.
  class Constraint < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, constant : Float64? = nil, multiplier : Float64? = nil, relation : Gtk::ConstraintRelation? = nil, source : Gtk::ConstraintTarget? = nil, source_attribute : Gtk::ConstraintAttribute? = nil, strength : Int32? = nil, target : Gtk::ConstraintTarget? = nil, target_attribute : Gtk::ConstraintAttribute? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if constant
        (_names.to_unsafe + _n).value = "constant".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, constant)
        _n += 1
      end
      if multiplier
        (_names.to_unsafe + _n).value = "multiplier".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, multiplier)
        _n += 1
      end
      if relation
        (_names.to_unsafe + _n).value = "relation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, relation)
        _n += 1
      end
      if source
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end
      if source_attribute
        (_names.to_unsafe + _n).value = "source-attribute".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source_attribute)
        _n += 1
      end
      if strength
        (_names.to_unsafe + _n).value = "strength".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strength)
        _n += 1
      end
      if target
        (_names.to_unsafe + _n).value = "target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target)
        _n += 1
      end
      if target_attribute
        (_names.to_unsafe + _n).value = "target-attribute".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target_attribute)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Constraint.g_type, _n, _names, _values)
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
      Gtk::ConstraintRelation.from_value(value)
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
      Gtk::ConstraintAttribute.from_value(value)
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
      Gtk::ConstraintAttribute.from_value(value)
    end

    def initialize(target : Gtk::ConstraintTarget?, target_attribute : Gtk::ConstraintAttribute, relation : Gtk::ConstraintRelation, source : Gtk::ConstraintTarget?, source_attribute : Gtk::ConstraintAttribute, multiplier : Float64, constant : Float64, strength : Int32)
      # gtk_constraint_new: (Constructor)
      # @target: (nullable)
      # @source: (nullable)
      # Returns: (transfer full)

      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end
      source = if source.nil?
                 Pointer(Void).null
               else
                 source.to_unsafe
               end

      _retval = LibGtk.gtk_constraint_new(target, target_attribute, relation, source, source_attribute, multiplier, constant, strength)
      @pointer = _retval
    end

    def self.new_constant(target : Gtk::ConstraintTarget?, target_attribute : Gtk::ConstraintAttribute, relation : Gtk::ConstraintRelation, constant : Float64, strength : Int32) : Gtk::Constraint
      # gtk_constraint_new_constant: (Constructor)
      # @target: (nullable)
      # Returns: (transfer full)

      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end

      _retval = LibGtk.gtk_constraint_new_constant(target, target_attribute, relation, constant, strength)
      Gtk::Constraint.new(_retval, GICrystal::Transfer::Full)
    end

    def constant : Float64
      # gtk_constraint_get_constant: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_constant(self)
      _retval
    end

    def multiplier : Float64
      # gtk_constraint_get_multiplier: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_multiplier(self)
      _retval
    end

    def relation : Gtk::ConstraintRelation
      # gtk_constraint_get_relation: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_relation(self)
      Gtk::ConstraintRelation.from_value(_retval)
    end

    def source : Gtk::ConstraintTarget?
      # gtk_constraint_get_source: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_source(self)
      Gtk::ConstraintTarget__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def source_attribute : Gtk::ConstraintAttribute
      # gtk_constraint_get_source_attribute: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_source_attribute(self)
      Gtk::ConstraintAttribute.from_value(_retval)
    end

    def strength : Int32
      # gtk_constraint_get_strength: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_strength(self)
      _retval
    end

    def target : Gtk::ConstraintTarget?
      # gtk_constraint_get_target: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_target(self)
      Gtk::ConstraintTarget__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def target_attribute : Gtk::ConstraintAttribute
      # gtk_constraint_get_target_attribute: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_get_target_attribute(self)
      Gtk::ConstraintAttribute.from_value(_retval)
    end

    def is_attached : Bool
      # gtk_constraint_is_attached: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_is_attached(self)
      GICrystal.to_bool(_retval)
    end

    def is_constant : Bool
      # gtk_constraint_is_constant: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_is_constant(self)
      GICrystal.to_bool(_retval)
    end

    def is_required : Bool
      # gtk_constraint_is_required: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_constraint_is_required(self)
      GICrystal.to_bool(_retval)
    end
  end
end
