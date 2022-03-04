require "./layout_manager"
require "./buildable"

module Gtk
  # A layout manager using constraints to describe relations between widgets.
  #
  # `GtkConstraintLayout` is a layout manager that uses relations between
  # widget attributes, expressed via [class@Gtk.Constraint] instances, to
  # measure and allocate widgets.
  #
  # ### How do constraints work
  #
  # Constraints are objects defining the relationship between attributes
  # of a widget; you can read the description of the [class@Gtk.Constraint]
  # class to have a more in depth definition.
  #
  # By taking multiple constraints and applying them to the children of
  # a widget using `GtkConstraintLayout`, it's possible to describe
  # complex layout policies; each constraint applied to a child or to the parent
  # widgets contributes to the full description of the layout, in terms of
  # parameters for resolving the value of each attribute.
  #
  # It is important to note that a layout is defined by the totality of
  # constraints; removing a child, or a constraint, from an existing layout
  # without changing the remaining constraints may result in an unstable
  # or unsolvable layout.
  #
  # Constraints have an implicit "reading order"; you should start describing
  # each edge of each child, as well as their relationship with the parent
  # container, from the top left (or top right, in RTL languages), horizontally
  # first, and then vertically.
  #
  # A constraint-based layout with too few constraints can become "unstable",
  # that is: have more than one solution. The behavior of an unstable layout
  # is undefined.
  #
  # A constraint-based layout with conflicting constraints may be unsolvable,
  # and lead to an unstable layout. You can use the [property@Gtk.Constraint:strength]
  # property of [class@Gtk.Constraint] to "nudge" the layout towards a solution.
  #
  # ### GtkConstraintLayout as GtkBuildable
  #
  # `GtkConstraintLayout` implements the [iface@Gtk.Buildable] interface and
  # has a custom "constraints" element which allows describing constraints in
  # a [class@Gtk.Builder] UI file.
  #
  # An example of a UI definition fragment specifying a constraint:
  #
  # ```xml
  #   <object class="GtkConstraintLayout">
  #     <constraints>
  #       <constraint target="button" target-attribute="start"
  #                   relation="eq"
  #                   source="super" source-attribute="start"
  #                   constant="12"
  #                   strength="required" />
  #       <constraint target="button" target-attribute="width"
  #                   relation="ge"
  #                   constant="250"
  #                   strength="strong" />
  #     </constraints>
  #   </object>
  # ```
  #
  # The definition above will add two constraints to the GtkConstraintLayout:
  #
  #  - a required constraint between the leading edge of "button" and
  #    the leading edge of the widget using the constraint layout, plus
  #    12 pixels
  #  - a strong, constant constraint making the width of "button" greater
  #    than, or equal to 250 pixels
  #
  # The "target" and "target-attribute" attributes are required.
  #
  # The "source" and "source-attribute" attributes of the "constraint"
  # element are optional; if they are not specified, the constraint is
  # assumed to be a constant.
  #
  # The "relation" attribute is optional; if not specified, the constraint
  # is assumed to be an equality.
  #
  # The "strength" attribute is optional; if not specified, the constraint
  # is assumed to be required.
  #
  # The "source" and "target" attributes can be set to "super" to indicate
  # that the constraint target is the widget using the GtkConstraintLayout.
  #
  # There can be "constant" and "multiplier" attributes.
  #
  # Additionally, the "constraints" element can also contain a description
  # of the `GtkConstraintGuides` used by the layout:
  #
  # ```xml
  #   <constraints>
  #     <guide min-width="100" max-width="500" name="hspace"/>
  #     <guide min-height="64" nat-height="128" name="vspace" strength="strong"/>
  #   </constraints>
  # ```
  #
  # The "guide" element has the following optional attributes:
  #
  #   - "min-width", "nat-width", and "max-width", describe the minimum,
  #     natural, and maximum width of the guide, respectively
  #   - "min-height", "nat-height", and "max-height", describe the minimum,
  #     natural, and maximum height of the guide, respectively
  #   - "strength" describes the strength of the constraint on the natural
  #     size of the guide; if not specified, the constraint is assumed to
  #     have a medium strength
  #   - "name" describes a name for the guide, useful when debugging
  #
  # ### Using the Visual Format Language
  #
  # Complex constraints can be described using a compact syntax called VFL,
  # or *Visual Format Language*.
  #
  # The Visual Format Language describes all the constraints on a row or
  # column, typically starting from the leading edge towards the trailing
  # one. Each element of the layout is composed by "views", which identify
  # a [iface@Gtk.ConstraintTarget].
  #
  # For instance:
  #
  # ```
  # [button] - [textField]
  # ```
  #
  # Describes a constraint that binds the trailing edge of "button" to the
  # leading edge of "textField", leaving a default space between the two.
  #
  # Using VFL is also possible to specify predicates that describe constraints
  # on attributes like width and height:
  #
  # ```
  #   // Width must be greater than, or equal to 50
  #   [button(>=50)]
  #
  #   // Width of button1 must be equal to width of button2
  #   [button1(==button2)]
  # ```
  #
  # The default orientation for a VFL description is horizontal, unless
  # otherwise specified:
  #
  # ```
  #   // horizontal orientation, default attribute: width
  #   H:[button(>=150)]
  #
  #   // vertical orientation, default attribute: height
  #   V:[button1(==button2)]
  # ```
  #
  # It's also possible to specify multiple predicates, as well as their
  # strength:
  #
  # ```
  #   // minimum width of button must be 150
  #   // natural width of button can be 250
  #   [button(>=150@required, ==250@medium)]
  # ```
  #
  # Finally, it's also possible to use simple arithmetic operators:
  #
  # ```
  #   // width of button1 must be equal to width of button2
  #   // divided by 2 plus 12
  #   [button1(button2 / 2 + 12)]
  # ```
  class ConstraintLayout < LayoutManager
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_constraint_layout_get_type
    end

    def initialize
      # gtk_constraint_layout_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_constraint_layout_new

      # Return value handling
      @pointer = _retval
    end

    def add_constraint(constraint : Gtk::Constraint) : Nil
      # gtk_constraint_layout_add_constraint: (Method)
      # @constraint: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(constraint)

      # C call
      LibGtk.gtk_constraint_layout_add_constraint(self, constraint)

      # Return value handling
    end

    def add_constraints_from_description(lines : Enumerable(::String), hspacing : Int32, vspacing : Int32, views : Pointer(Void)) : GLib::List
      # gtk_constraint_layout_add_constraints_from_descriptionv: (Method | Throws)
      # @lines: (array length=n_lines element-type Utf8)
      # Returns: (transfer container)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      n_lines = lines.size
      lines = lines.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGtk.gtk_constraint_layout_add_constraints_from_descriptionv(self, lines, n_lines, hspacing, vspacing, views, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GLib::List(Gtk::Constraint).new(_retval, GICrystal::Transfer::Container)
    end

    def add_guide(guide : Gtk::ConstraintGuide) : Nil
      # gtk_constraint_layout_add_guide: (Method)
      # @guide: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(guide)

      # C call
      LibGtk.gtk_constraint_layout_add_guide(self, guide)

      # Return value handling
    end

    def observe_constraints : Gio::ListModel
      # gtk_constraint_layout_observe_constraints: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_constraint_layout_observe_constraints(self)

      # Return value handling
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def observe_guides : Gio::ListModel
      # gtk_constraint_layout_observe_guides: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_constraint_layout_observe_guides(self)

      # Return value handling
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def remove_all_constraints : Nil
      # gtk_constraint_layout_remove_all_constraints: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_constraint_layout_remove_all_constraints(self)

      # Return value handling
    end

    def remove_constraint(constraint : Gtk::Constraint) : Nil
      # gtk_constraint_layout_remove_constraint: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_constraint_layout_remove_constraint(self, constraint)

      # Return value handling
    end

    def remove_guide(guide : Gtk::ConstraintGuide) : Nil
      # gtk_constraint_layout_remove_guide: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_constraint_layout_remove_guide(self, guide)

      # Return value handling
    end
  end
end
