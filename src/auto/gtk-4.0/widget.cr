require "../g_object-2.0/initially_unowned"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # The base class for all widgets.
  #
  # `GtkWidget` is the base class all widgets in GTK derive from. It manages the
  # widget lifecycle, layout, states and style.
  #
  # ### Height-for-width Geometry Management
  #
  # GTK uses a height-for-width (and width-for-height) geometry management
  # system. Height-for-width means that a widget can change how much
  # vertical space it needs, depending on the amount of horizontal space
  # that it is given (and similar for width-for-height). The most common
  # example is a label that reflows to fill up the available width, wraps
  # to fewer lines, and therefore needs less height.
  #
  # Height-for-width geometry management is implemented in GTK by way
  # of two virtual methods:
  #
  # - `Gtk::Widget#request_mode`
  # - `Gtk::Widget#measure`
  #
  # There are some important things to keep in mind when implementing
  # height-for-width and when using it in widget implementations.
  #
  # If you implement a direct `GtkWidget` subclass that supports
  # height-for-width or width-for-height geometry management for itself
  # or its child widgets, the `Gtk::Widget#request_mode` virtual
  # function must be implemented as well and return the widget's preferred
  # request mode. The default implementation of this virtual function
  # returns %GTK_SIZE_REQUEST_CONSTANT_SIZE, which means that the widget will
  # only ever get -1 passed as the for_size value to its
  # `Gtk::Widget#measure` implementation.
  #
  # The geometry management system will query a widget hierarchy in
  # only one orientation at a time. When widgets are initially queried
  # for their minimum sizes it is generally done in two initial passes
  # in the `Gtk#SizeRequestMode` chosen by the toplevel.
  #
  # For example, when queried in the normal %GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH mode:
  #
  # First, the default minimum and natural width for each widget
  # in the interface will be computed using `#gtk_widget_measure` with an
  # orientation of %GTK_ORIENTATION_HORIZONTAL and a for_size of -1.
  # Because the preferred widths for each widget depend on the preferred
  # widths of their children, this information propagates up the hierarchy,
  # and finally a minimum and natural width is determined for the entire
  # toplevel. Next, the toplevel will use the minimum width to query for the
  # minimum height contextual to that width using `#gtk_widget_measure` with an
  # orientation of %GTK_ORIENTATION_VERTICAL and a for_size of the just computed
  # width. This will also be a highly recursive operation. The minimum height
  # for the minimum width is normally used to set the minimum size constraint
  # on the toplevel.
  #
  # After the toplevel window has initially requested its size in both
  # dimensions it can go on to allocate itself a reasonable size (or a size
  # previously specified with `Gtk::Window#default_size=`). During the
  # recursive allocation process it’s important to note that request cycles
  # will be recursively executed while widgets allocate their children.
  # Each widget, once allocated a size, will go on to first share the
  # space in one orientation among its children and then request each child's
  # height for its target allocated width or its width for allocated height,
  # depending. In this way a `GtkWidget` will typically be requested its size
  # a number of times before actually being allocated a size. The size a
  # widget is finally allocated can of course differ from the size it has
  # requested. For this reason, `GtkWidget` caches a  small number of results
  # to avoid re-querying for the same sizes in one allocation cycle.
  #
  # If a widget does move content around to intelligently use up the
  # allocated size then it must support the request in both
  # `GtkSizeRequestMode`s even if the widget in question only
  # trades sizes in a single orientation.
  #
  # For instance, a `Gtk#Label` that does height-for-width word wrapping
  # will not expect to have `Gtk::Widget#measure` with an orientation of
  # %GTK_ORIENTATION_VERTICAL called because that call is specific to a
  # width-for-height request. In this case the label must return the height
  # required for its own minimum possible width. By following this rule any
  # widget that handles height-for-width or width-for-height requests will
  # always be allocated at least enough space to fit its own content.
  #
  # Here are some examples of how a %GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH widget
  # generally deals with width-for-height requests:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # foo_widget_measure (GtkWidget      *widget,
  #                     GtkOrientation  orientation,
  #                     int             for_size,
  #                     int            *minimum_size,
  #                     int            *natural_size,
  #                     int            *minimum_baseline,
  #                     int            *natural_baseline)
  # {
  #   if (orientation == GTK_ORIENTATION_HORIZONTAL)
  #     {
  #       // Calculate minimum and natural width
  #     }
  #   else // VERTICAL
  #     {
  #       if (i_am_in_height_for_width_mode)
  #         {
  #           int min_width, dummy;
  #
  #           // First, get the minimum width of our widget
  #           GTK_WIDGET_GET_CLASS (widget)->measure (widget, GTK_ORIENTATION_HORIZONTAL, -1,
  #                                                   &min_width, &dummy, &dummy, &dummy);
  #
  #           // Now use the minimum width to retrieve the minimum and natural height to display
  #           // that width.
  #           GTK_WIDGET_GET_CLASS (widget)->measure (widget, GTK_ORIENTATION_VERTICAL, min_width,
  #                                                   minimum_size, natural_size, &dummy, &dummy);
  #         }
  #       else
  #         {
  #           // ... some widgets do both.
  #         }
  #     }
  # }
  # ```
  #
  # Often a widget needs to get its own request during size request or
  # allocation. For example, when computing height it may need to also
  # compute width. Or when deciding how to use an allocation, the widget
  # may need to know its natural size. In these cases, the widget should
  # be careful to call its virtual methods directly, like in the code
  # example above.
  #
  # It will not work to use the wrapper function `Gtk::Widget#measure`
  # inside your own `Gtk::Widget#size_allocate` implementation.
  # These return a request adjusted by `Gtk#SizeGroup`, the widget's
  # align and expand flags, as well as its CSS style.
  #
  # If a widget used the wrappers inside its virtual method implementations,
  # then the adjustments (such as widget margins) would be applied
  # twice. GTK therefore does not allow this and will warn if you try
  # to do it.
  #
  # Of course if you are getting the size request for another widget, such
  # as a child widget, you must use `#gtk_widget_measure`; otherwise, you
  # would not properly consider widget margins, `Gtk#SizeGroup`, and
  # so forth.
  #
  # GTK also supports baseline vertical alignment of widgets. This
  # means that widgets are positioned such that the typographical baseline of
  # widgets in the same row are aligned. This happens if a widget supports
  # baselines, has a vertical alignment of %GTK_ALIGN_BASELINE, and is inside
  # a widget that supports baselines and has a natural “row” that it aligns to
  # the baseline, or a baseline assigned to it by the grandparent.
  #
  # Baseline alignment support for a widget is also done by the
  # `Gtk::Widget#measure` virtual function. It allows you to report
  # both a minimum and natural size.
  #
  # If a widget ends up baseline aligned it will be allocated all the space in
  # the parent as if it was %GTK_ALIGN_FILL, but the selected baseline can be
  # found via `#gtk_widget_get_allocated_baseline`. If the baseline has a
  # value other than -1 you need to align the widget such that the baseline
  # appears at the position.
  #
  # ### GtkWidget as GtkBuildable
  #
  # The `GtkWidget` implementation of the `GtkBuildable` interface
  # supports various custom elements to specify additional aspects of widgets
  # that are not directly expressed as properties.
  #
  # If the widget uses a `Gtk#LayoutManager`, `GtkWidget` supports
  # a custom `<layout>` element, used to define layout properties:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkGrid" id="my_grid">
  #   <child>
  #     <object class="GtkLabel" id="label1">
  #       <property name="label">Description</property>
  #       <layout>
  #         <property name="column">0</property>
  #         <property name="row">0</property>
  #         <property name="row-span">1</property>
  #         <property name="column-span">1</property>
  #       </layout>
  #     </object>
  #   </child>
  #   <child>
  #     <object class="GtkEntry" id="description_entry">
  #       <layout>
  #         <property name="column">1</property>
  #         <property name="row">0</property>
  #         <property name="row-span">1</property>
  #         <property name="column-span">1</property>
  #       </layout>
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # `GtkWidget` allows style information such as style classes to
  # be associated with widgets, using the custom `<style>` element:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkButton" id="button1">
  #   <style>
  #     <class name="my-special-button-class"/>
  #     <class name="dark-button"/>
  #   </style>
  # </object>
  # ```
  #
  # `GtkWidget` allows defining accessibility information, such as properties,
  # relations, and states, using the custom `<accessibility>` element:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkButton" id="button1">
  #   <accessibility>
  #     <property name="label">Download</property>
  #     <relation name="labelled-by">label1</relation>
  #   </accessibility>
  # </object>
  # ```
  #
  # ### Building composite widgets from template XML
  #
  # `GtkWidget `exposes some facilities to automate the procedure
  # of creating composite widgets using "templates".
  #
  # To create composite widgets with `GtkBuilder` XML, one must associate
  # the interface description with the widget class at class initialization
  # time using `Gtk::WidgetClass#template=`.
  #
  # The interface description semantics expected in composite template descriptions
  # is slightly different from regular `Gtk#Builder` XML.
  #
  # Unlike regular interface descriptions, `Gtk::WidgetClass#template=` will
  # expect a `<template>` tag as a direct child of the toplevel `<interface>`
  # tag. The `<template>` tag must specify the “class” attribute which must be
  # the type name of the widget. Optionally, the “parent” attribute may be
  # specified to specify the direct parent type of the widget type, this is
  # ignored by `GtkBuilder` but required for UI design tools like
  # [Glade](https://glade.gnome.org/) to introspect what kind of properties and
  # internal children exist for a given type when the actual type does not exist.
  #
  # The XML which is contained inside the `<template>` tag behaves as if it were
  # added to the `<object>` tag defining the widget itself. You may set properties
  # on a widget by inserting `<property>` tags into the `<template>` tag, and also
  # add `<child>` tags to add children and extend a widget in the normal way you
  # would with `<object>` tags.
  #
  # Additionally, `<object>` tags can also be added before and after the initial
  # `<template>` tag in the normal way, allowing one to define auxiliary objects
  # which might be referenced by other widgets declared as children of the
  # `<template>` tag.
  #
  # An example of a template definition:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <interface>
  #   <template class="FooWidget" parent="GtkBox">
  #     <property name="orientation">horizontal</property>
  #     <property name="spacing">4</property>
  #     <child>
  #       <object class="GtkButton" id="hello_button">
  #         <property name="label">Hello World</property>
  #         <signal name="clicked" handler="hello_button_clicked" object="FooWidget" swapped="yes"/>
  #       </object>
  #     </child>
  #     <child>
  #       <object class="GtkButton" id="goodbye_button">
  #         <property name="label">Goodbye World</property>
  #       </object>
  #     </child>
  #   </template>
  # </interface>
  # ```
  #
  # Typically, you'll place the template fragment into a file that is
  # bundled with your project, using `GResource`. In order to load the
  # template, you need to call `Gtk::WidgetClass#template_from_resource=`
  # from the class initialization of your `GtkWidget` type:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # foo_widget_class_init (FooWidgetClass *klass)
  # {
  #   // ...
  #
  #   gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
  #                                                "/com/example/ui/foowidget.ui");
  # }
  # ```
  #
  # You will also need to call `Gtk::Widget#init_template` from the
  # instance initialization function:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # foo_widget_init (FooWidget *self)
  # {
  #   // ...
  #   gtk_widget_init_template (GTK_WIDGET (self));
  # }
  # ```
  #
  # You can access widgets defined in the template using the
  # `#gtk_widget_get_template_child` function, but you will typically declare
  # a pointer in the instance private data structure of your type using the same
  # name as the widget in the template definition, and call
  # `Gtk::WidgetClass#bind_template_child_full` (or one of its wrapper macros
  # `Gtk#widget_class_bind_template_child` and `Gtk#widget_class_bind_template_child_private`)
  # with that name, e.g.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # typedef struct {
  #   GtkWidget *hello_button;
  #   GtkWidget *goodbye_button;
  # } FooWidgetPrivate;
  #
  # G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)
  #
  # static void
  # foo_widget_class_init (FooWidgetClass *klass)
  # {
  #   // ...
  #   gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
  #                                                "/com/example/ui/foowidget.ui");
  #   gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
  #                                                 FooWidget, hello_button);
  #   gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
  #                                                 FooWidget, goodbye_button);
  # }
  #
  # static void
  # foo_widget_init (FooWidget *widget)
  # {
  #
  # }
  # ```
  #
  # You can also use `Gtk::WidgetClass#bind_template_callback_full` (or
  # is wrapper macro `Gtk#widget_class_bind_template_callback`) to connect
  # a signal callback defined in the template with a function visible in the
  # scope of the class, e.g.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # // the signal handler has the instance and user data swapped
  # // because of the swapped="yes" attribute in the template XML
  # static void
  # hello_button_clicked (FooWidget *self,
  #                       GtkButton *button)
  # {
  #   g_print ("Hello, world!\n");
  # }
  #
  # static void
  # foo_widget_class_init (FooWidgetClass *klass)
  # {
  #   // ...
  #   gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
  #                                                "/com/example/ui/foowidget.ui");
  #   gtk_widget_class_bind_template_callback (GTK_WIDGET_CLASS (klass), hello_button_clicked);
  # }
  # ```
  @[GObject::GeneratedWrapper]
  class Widget < GObject::InitiallyUnowned
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::WidgetClass), class_init,
        sizeof(LibGtk::Widget), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[35]
      _values = StaticArray(LibGObject::Value, 35).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Widget.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_widget_get_type
    end

    def can_focus=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-focus", unsafe_value, Pointer(Void).null)
      value
    end

    def can_focus? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-focus", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def can_target=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-target", unsafe_value, Pointer(Void).null)
      value
    end

    def can_target? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-target", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def css_classes=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "css-classes", unsafe_value, Pointer(Void).null)
      value
    end

    def css_classes : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "css-classes", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def css_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "css-name", unsafe_value, Pointer(Void).null)
      value
    end

    def css_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "css-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def cursor=(value : Gdk::Cursor?) : Gdk::Cursor?
      unsafe_value = value

      LibGObject.g_object_set(self, "cursor", unsafe_value, Pointer(Void).null)
      value
    end

    def cursor : Gdk::Cursor?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "cursor", pointerof(value), Pointer(Void).null)
      Gdk::Cursor.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def focus_on_click=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "focus-on-click", unsafe_value, Pointer(Void).null)
      value
    end

    def focus_on_click? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "focus-on-click", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def focusable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "focusable", unsafe_value, Pointer(Void).null)
      value
    end

    def focusable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "focusable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def halign=(value : Gtk::Align) : Gtk::Align
      unsafe_value = value

      LibGObject.g_object_set(self, "halign", unsafe_value, Pointer(Void).null)
      value
    end

    def halign : Gtk::Align
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "halign", pointerof(value), Pointer(Void).null)
      Gtk::Align.new(value)
    end

    def has_default? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-default", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_focus? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-focus", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_tooltip=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-tooltip", unsafe_value, Pointer(Void).null)
      value
    end

    def has_tooltip? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-tooltip", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def height_request=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "height-request", unsafe_value, Pointer(Void).null)
      value
    end

    def height_request : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "height-request", pointerof(value), Pointer(Void).null)
      value
    end

    def hexpand=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "hexpand", unsafe_value, Pointer(Void).null)
      value
    end

    def hexpand? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "hexpand", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def hexpand_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "hexpand-set", unsafe_value, Pointer(Void).null)
      value
    end

    def hexpand_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "hexpand-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def layout_manager=(value : Gtk::LayoutManager?) : Gtk::LayoutManager?
      unsafe_value = value

      LibGObject.g_object_set(self, "layout-manager", unsafe_value, Pointer(Void).null)
      value
    end

    def layout_manager : Gtk::LayoutManager?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "layout-manager", pointerof(value), Pointer(Void).null)
      Gtk::LayoutManager.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def margin_bottom=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "margin-bottom", unsafe_value, Pointer(Void).null)
      value
    end

    def margin_bottom : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "margin-bottom", pointerof(value), Pointer(Void).null)
      value
    end

    def margin_end=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "margin-end", unsafe_value, Pointer(Void).null)
      value
    end

    def margin_end : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "margin-end", pointerof(value), Pointer(Void).null)
      value
    end

    def margin_start=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "margin-start", unsafe_value, Pointer(Void).null)
      value
    end

    def margin_start : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "margin-start", pointerof(value), Pointer(Void).null)
      value
    end

    def margin_top=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "margin-top", unsafe_value, Pointer(Void).null)
      value
    end

    def margin_top : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "margin-top", pointerof(value), Pointer(Void).null)
      value
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def opacity=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "opacity", unsafe_value, Pointer(Void).null)
      value
    end

    def opacity : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "opacity", pointerof(value), Pointer(Void).null)
      value
    end

    def overflow=(value : Gtk::Overflow) : Gtk::Overflow
      unsafe_value = value

      LibGObject.g_object_set(self, "overflow", unsafe_value, Pointer(Void).null)
      value
    end

    def overflow : Gtk::Overflow
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "overflow", pointerof(value), Pointer(Void).null)
      Gtk::Overflow.new(value)
    end

    def parent : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parent", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def receives_default=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "receives-default", unsafe_value, Pointer(Void).null)
      value
    end

    def receives_default? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "receives-default", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def root : Gtk::Root?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "root", pointerof(value), Pointer(Void).null)
      Gtk::Root__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def scale_factor : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "scale-factor", pointerof(value), Pointer(Void).null)
      value
    end

    def sensitive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "sensitive", unsafe_value, Pointer(Void).null)
      value
    end

    def sensitive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "sensitive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tooltip_markup=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "tooltip-markup", unsafe_value, Pointer(Void).null)
      value
    end

    def tooltip_markup : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "tooltip-markup", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def tooltip_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "tooltip-text", unsafe_value, Pointer(Void).null)
      value
    end

    def tooltip_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "tooltip-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def valign=(value : Gtk::Align) : Gtk::Align
      unsafe_value = value

      LibGObject.g_object_set(self, "valign", unsafe_value, Pointer(Void).null)
      value
    end

    def valign : Gtk::Align
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "valign", pointerof(value), Pointer(Void).null)
      Gtk::Align.new(value)
    end

    def vexpand=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "vexpand", unsafe_value, Pointer(Void).null)
      value
    end

    def vexpand? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "vexpand", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def vexpand_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "vexpand-set", unsafe_value, Pointer(Void).null)
      value
    end

    def vexpand_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "vexpand-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visible", unsafe_value, Pointer(Void).null)
      value
    end

    def visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def width_request=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "width-request", unsafe_value, Pointer(Void).null)
      value
    end

    def width_request : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width-request", pointerof(value), Pointer(Void).null)
      value
    end

    # Obtains the current default reading direction.
    #
    # See `Gtk::Widget#default_direction=`.
    def self.default_direction : Gtk::TextDirection
      # gtk_widget_get_default_direction: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_default_direction

      # Return value handling

      Gtk::TextDirection.new(_retval)
    end

    # Sets the default reading direction for widgets.
    #
    # See `Gtk::Widget#direction=`.
    def self.default_direction=(dir : Gtk::TextDirection) : Nil
      # gtk_widget_set_default_direction: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_default_direction(dir)

      # Return value handling
    end

    # Enable or disable an action installed with
    # gtk_widget_class_install_action().
    def action_set_enabled(action_name : ::String, enabled : Bool) : Nil
      # gtk_widget_action_set_enabled: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_action_set_enabled(self, action_name, enabled)

      # Return value handling
    end

    # For widgets that can be “activated” (buttons, menu items, etc.),
    # this function activates them.
    #
    # The activation will emit the signal set using
    # `Gtk::WidgetClass#activate_signal=` during class initialization.
    #
    # Activation is what happens when you press <kbd>Enter</kbd>
    # on a widget during key navigation.
    #
    # If you wish to handle the activation keybinding yourself, it is
    # recommended to use `Gtk::WidgetClass#add_shortcut` with an action
    # created with `Gtk::SignalAction.new`.
    #
    # If @widget isn't activatable, the function returns %FALSE.
    def activate : Bool
      # gtk_widget_activate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_activate(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Looks up the action in the action groups associated
    # with @widget and its ancestors, and activates it.
    #
    # This is a wrapper around `Gtk::Widget#activate_action_variant`
    # that constructs the @args variant according to @format_string.
    def activate_action(name : ::String, args : _?) : Bool
      # gtk_widget_activate_action_variant: (Method)
      # @args: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      args = if args.nil?
               Pointer(Void).null
             elsif !args.is_a?(GLib::Variant)
               GLib::Variant.new(args).to_unsafe
             else
               args.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_widget_activate_action_variant(self, name, args)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Activates the `default.activate` action from @widget.
    def activate_default : Nil
      # gtk_widget_activate_default: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_activate_default(self)

      # Return value handling
    end

    # Adds @controller to @widget so that it will receive events.
    #
    # You will usually want to call this function right after
    # creating any kind of `Gtk#EventController`.
    def add_controller(controller : Gtk::EventController) : Nil
      # gtk_widget_add_controller: (Method)
      # @controller: (transfer full)
      # Returns: (transfer none)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(controller)

      # C call
      LibGtk.gtk_widget_add_controller(self, controller)

      # Return value handling
    end

    # Adds a style class to @widget.
    #
    # After calling this function, the widgets style will match
    # for @css_class, according to CSS matching rules.
    #
    # Use `Gtk::Widget#remove_css_class` to remove the
    # style again.
    def add_css_class(css_class : ::String) : Nil
      # gtk_widget_add_css_class: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_add_css_class(self, css_class)

      # Return value handling
    end

    # Adds a widget to the list of mnemonic labels for this widget.
    #
    # See `Gtk::Widget#list_mnemonic_labels`. Note the
    # list of mnemonic labels for the widget is cleared when the
    # widget is destroyed, so the caller must make sure to update
    # its internal state at this point as well.
    def add_mnemonic_label(label : Gtk::Widget) : Nil
      # gtk_widget_add_mnemonic_label: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_add_mnemonic_label(self, label)

      # Return value handling
    end

    # Queues an animation frame update and adds a callback to be called
    # before each frame.
    #
    # Until the tick callback is removed, it will be called frequently
    # (usually at the frame rate of the output device or as quickly as
    # the application can be repainted, whichever is slower). For this
    # reason, is most suitable for handling graphics that change every
    # frame or every few frames. The tick callback does not automatically
    # imply a relayout or repaint. If you want a repaint or relayout, and
    # aren’t changing widget properties that would trigger that (for example,
    # changing the text of a `GtkLabel`), then you will have to call
    # `Gtk::Widget#queue_resize` or `Gtk::Widget#queue_draw`
    # yourself.
    #
    # `Gdk::FrameClock#frame_time` should generally be used
    # for timing continuous animations and
    # `Gdk::FrameTimings#predicted_presentation_time` if you are
    # trying to display isolated frames at particular times.
    #
    # This is a more convenient alternative to connecting directly to the
    # `Gdk::FrameClock::#update` signal of `GdkFrameClock`, since you
    # don't have to worry about when a `GdkFrameClock` is assigned to a widget.
    def add_tick_callback(callback : Pointer(Void), user_data : Pointer(Void)?, notify : Pointer(Void)) : UInt32
      # gtk_widget_add_tick_callback: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_widget_add_tick_callback(self, callback, user_data, notify)

      # Return value handling

      _retval
    end

    # This function is only used by `GtkWidget` subclasses, to
    # assign a size, position and (optionally) baseline to their
    # child widgets.
    #
    # In this function, the allocation and baseline may be adjusted.
    # The given allocation will be forced to be bigger than the
    # widget's minimum size, as well as at least 0×0 in size.
    #
    # For a version that does not take a transform, see
    # `Gtk::Widget#size_allocate`.
    def allocate(width : Int32, height : Int32, baseline : Int32, transform : Gsk::Transform?) : Nil
      # gtk_widget_allocate: (Method)
      # @transform: (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      transform = if transform.nil?
                    Pointer(Void).null
                  else
                    transform.to_unsafe
                  end

      # C call
      LibGtk.gtk_widget_allocate(self, width, height, baseline, transform)

      # Return value handling
    end

    # Called by widgets as the user moves around the window using
    # keyboard shortcuts.
    #
    # The @direction argument indicates what kind of motion is taking place (up,
    # down, left, right, tab forward, tab backward).
    #
    # This function calls the `Gtk::Widget#focus` virtual function; widgets
    # can override the virtual function in order to implement appropriate focus
    # behavior.
    #
    # The default `focus()` virtual function for a widget should return `TRUE` if
    # moving in @direction left the focus on a focusable location inside that
    # widget, and `FALSE` if moving in @direction moved the focus outside the
    # widget. When returning `TRUE`, widgets normallycall `Gtk::Widget#grab_focus`
    # to place the focus accordingly; when returning `FALSE`, they don’t modify
    # the current focus location.
    #
    # This function is used by custom widget implementations; if you're
    # writing an app, you’d use `Gtk::Widget#grab_focus` to move
    # the focus to a particular widget.
    def child_focus(direction : Gtk::DirectionType) : Bool
      # gtk_widget_child_focus: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_child_focus(self, direction)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Computes the bounds for @widget in the coordinate space of @target.
    #
    # FIXME: Explain what "bounds" are.
    #
    # If the operation is successful, %TRUE is returned. If @widget has no
    # bounds or the bounds cannot be expressed in @target's coordinate space
    # (for example if both widgets are in different windows), %FALSE is
    # returned and @bounds is set to the zero rectangle.
    #
    # It is valid for @widget and @target to be the same widget.
    def compute_bounds(target : Gtk::Widget) : Graphene::Rect
      # gtk_widget_compute_bounds: (Method)
      # @out_bounds: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      out_bounds = Graphene::Rect.new

      # C call
      _retval = LibGtk.gtk_widget_compute_bounds(self, target, out_bounds)

      # Return value handling

      out_bounds
    end

    # Computes whether a container should give this widget
    # extra space when possible.
    #
    # Containers should check this, rather than looking at
    # `Gtk::Widget#hexpand` or `Gtk::Widget#vexpand`.
    #
    # This function already checks whether the widget is visible, so
    # visibility does not need to be checked separately. Non-visible
    # widgets are not expanded.
    #
    # The computed expand value uses either the expand setting explicitly
    # set on the widget itself, or, if none has been explicitly set,
    # the widget may expand if some of its children do.
    def compute_expand(orientation : Gtk::Orientation) : Bool
      # gtk_widget_compute_expand: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_compute_expand(self, orientation)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Translates the given @point in @widget's coordinates to coordinates
    # relative to @target’s coordinate system.
    #
    # In order to perform this operation, both widgets must share a
    # common ancestor.
    def compute_point(target : Gtk::Widget, point : Graphene::Point) : Graphene::Point
      # gtk_widget_compute_point: (Method)
      # @out_point: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      out_point = Graphene::Point.new

      # C call
      _retval = LibGtk.gtk_widget_compute_point(self, target, point, out_point)

      # Return value handling

      out_point
    end

    # Computes a matrix suitable to describe a transformation from
    # @widget's coordinate system into @target's coordinate system.
    #
    # The transform can not be computed in certain cases, for example
    # when @widget and @target do not share a common ancestor. In that
    # case @out_transform gets set to the identity matrix.
    def compute_transform(target : Gtk::Widget) : Graphene::Matrix
      # gtk_widget_compute_transform: (Method)
      # @out_transform: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      out_transform = Graphene::Matrix.new

      # C call
      _retval = LibGtk.gtk_widget_compute_transform(self, target, out_transform)

      # Return value handling

      out_transform
    end

    # Tests if the point at (@x, @y) is contained in @widget.
    #
    # The coordinates for (@x, @y) must be in widget coordinates, so
    # (0, 0) is assumed to be the top left of @widget's content area.
    def contains(x : Float64, y : Float64) : Bool
      # gtk_widget_contains: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_contains(self, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a new `PangoContext` with the appropriate font map,
    # font options, font description, and base direction for drawing
    # text for this widget.
    #
    # See also `Gtk::Widget#pango_context`.
    def create_pango_context : Pango::Context
      # gtk_widget_create_pango_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_widget_create_pango_context(self)

      # Return value handling

      Pango::Context.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `PangoLayout` with the appropriate font map,
    # font description, and base direction for drawing text for
    # this widget.
    #
    # If you keep a `PangoLayout` created in this way around,
    # you need to re-create it when the widget `PangoContext`
    # is replaced. This can be tracked by listening to changes
    # of the `Gtk::Widget#root` property on the widget.
    def create_pango_layout(text : ::String?) : Pango::Layout
      # gtk_widget_create_pango_layout: (Method)
      # @text: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_widget_create_pango_layout(self, text)

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::Full)
    end

    # Checks to see if a drag movement has passed the GTK drag threshold.
    def drag_check_threshold(start_x : Int32, start_y : Int32, current_x : Int32, current_y : Int32) : Bool
      # gtk_drag_check_threshold: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drag_check_threshold(self, start_x, start_y, current_x, current_y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Notifies the user about an input-related error on this widget.
    #
    # If the [property@Gtk.Settings:gtk-error-bell] setting is %TRUE,
    # it calls `Gdk::Surface#beep`, otherwise it does nothing.
    #
    # Note that the effect of `Gdk::Surface#beep` can be configured
    # in many ways, depending on the windowing backend and the desktop
    # environment or window manager that is used.
    def error_bell : Nil
      # gtk_widget_error_bell: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_error_bell(self)

      # Return value handling
    end

    # Returns the baseline that has currently been allocated to @widget.
    #
    # This function is intended to be used when implementing handlers
    # for the `GtkWidget`Class.snapshot() function, and when allocating
    # child widgets in `GtkWidget`Class.size_allocate().
    def allocated_baseline : Int32
      # gtk_widget_get_allocated_baseline: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_allocated_baseline(self)

      # Return value handling

      _retval
    end

    # Returns the height that has currently been allocated to @widget.
    def allocated_height : Int32
      # gtk_widget_get_allocated_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_allocated_height(self)

      # Return value handling

      _retval
    end

    # Returns the width that has currently been allocated to @widget.
    def allocated_width : Int32
      # gtk_widget_get_allocated_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_allocated_width(self)

      # Return value handling

      _retval
    end

    # Retrieves the widget’s allocation.
    #
    # Note, when implementing a layout container: a widget’s allocation
    # will be its “adjusted” allocation, that is, the widget’s parent
    # typically calls `Gtk::Widget#size_allocate` with an allocation,
    # and that allocation is then adjusted (to handle margin
    # and alignment for example) before assignment to the widget.
    # `Gtk::Widget#allocation` returns the adjusted allocation that
    # was actually assigned to the widget. The adjusted allocation is
    # guaranteed to be completely contained within the
    # `Gtk::Widget#size_allocate` allocation, however.
    #
    # So a layout container is guaranteed that its children stay inside
    # the assigned bounds, but not that they have exactly the bounds the
    # container assigned.
    def allocation : Gdk::Rectangle
      # gtk_widget_get_allocation: (Method)
      # @allocation: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      allocation = Gdk::Rectangle.new

      # C call
      LibGtk.gtk_widget_get_allocation(self, allocation)

      # Return value handling

      allocation
    end

    # Gets the first ancestor of @widget with type @widget_type.
    #
    # For example, `gtk_widget_get_ancestor (widget, GTK_TYPE_BOX)`
    # gets the first `GtkBox` that’s an ancestor of @widget. No
    # reference will be added to the returned widget; it should
    # not be unreferenced.
    #
    # Note that unlike `Gtk::Widget#is_ancestor?`, this function
    # considers @widget to be an ancestor of itself.
    def ancestor(widget_type : UInt64) : Gtk::Widget?
      # gtk_widget_get_ancestor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_ancestor(self, widget_type)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Determines whether the input focus can enter @widget or any
    # of its children.
    #
    # See `Gtk::Widget#focusable=`.
    def can_focus : Bool
      # gtk_widget_get_can_focus: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_can_focus(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Queries whether @widget can be the target of pointer events.
    def can_target : Bool
      # gtk_widget_get_can_target: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_can_target(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value set with gtk_widget_set_child_visible().
    #
    # If you feel a need to use this function, your code probably
    # needs reorganization.
    #
    # This function is only useful for container implementations
    # and should never be called by an application.
    def child_visible : Bool
      # gtk_widget_get_child_visible: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_child_visible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the clipboard object for @widget.
    #
    # This is a utility function to get the clipboard object for the
    # `GdkDisplay` that @widget is using.
    #
    # Note that this function always works, even when @widget is not
    # realized yet.
    def clipboard : Gdk::Clipboard
      # gtk_widget_get_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_clipboard(self)

      # Return value handling

      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the list of style classes applied to @widget.
    def css_classes : Enumerable(::String)
      # gtk_widget_get_css_classes: (Method | Getter)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_widget_get_css_classes(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Returns the CSS name that is used for @self.
    def css_name : ::String
      # gtk_widget_get_css_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_css_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Queries the cursor set on @widget.
    #
    # See `Gtk::Widget#cursor=` for details.
    def cursor : Gdk::Cursor?
      # gtk_widget_get_cursor: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_cursor(self)

      # Return value handling

      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the reading direction for a particular widget.
    #
    # See `Gtk::Widget#direction=`.
    def direction : Gtk::TextDirection
      # gtk_widget_get_direction: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_direction(self)

      # Return value handling

      Gtk::TextDirection.new(_retval)
    end

    # Get the `GdkDisplay` for the toplevel window associated with
    # this widget.
    #
    # This function can only be called after the widget has been
    # added to a widget hierarchy with a `GtkWindow` at the top.
    #
    # In general, you should only create display specific
    # resources when a widget has been realized, and you should
    # free those resources when the widget is unrealized.
    def display : Gdk::Display
      # gtk_widget_get_display: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the widgets first child.
    #
    # This API is primarily meant for widget implementations.
    def first_child : Gtk::Widget?
      # gtk_widget_get_first_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_first_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the current focus child of @widget.
    def focus_child : Gtk::Widget?
      # gtk_widget_get_focus_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_focus_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the widget should grab focus when it is clicked
    # with the mouse.
    #
    # See `Gtk::Widget#focus_on_click=`.
    def focus_on_click : Bool
      # gtk_widget_get_focus_on_click: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_focus_on_click(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines whether @widget can own the input focus.
    #
    # See `Gtk::Widget#focusable=`.
    def focusable : Bool
      # gtk_widget_get_focusable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_focusable(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the font map of @widget.
    #
    # See `Gtk::Widget#font_map=`.
    def font_map : Pango::FontMap?
      # gtk_widget_get_font_map: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_font_map(self)

      # Return value handling

      Pango::FontMap.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the `cairo_font_options_t` of widget.
    #
    # Seee `Gtk::Widget#font_options=`.
    def font_options : Cairo::FontOptions?
      # gtk_widget_get_font_options: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_font_options(self)

      # Return value handling

      Cairo::FontOptions.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Obtains the frame clock for a widget.
    #
    # The frame clock is a global “ticker” that can be used to drive
    # animations and repaints. The most common reason to get the frame
    # clock is to call `Gdk::FrameClock#frame_time`, in order
    # to get a time to use for animating. For example you might record
    # the start of the animation with an initial value from
    # `Gdk::FrameClock#frame_time`, and then update the animation
    # by calling `Gdk::FrameClock#frame_time` again during each repaint.
    #
    # `Gdk::FrameClock#request_phase` will result in a new frame on the
    # clock, but won’t necessarily repaint any widgets. To repaint a
    # widget, you have to use `Gtk::Widget#queue_draw` which invalidates
    # the widget (thus scheduling it to receive a draw on the next
    # frame). gtk_widget_queue_draw() will also end up requesting a frame
    # on the appropriate frame clock.
    #
    # A widget’s frame clock will not change while the widget is
    # mapped. Reparenting a widget (which implies a temporary unmap) can
    # change the widget’s frame clock.
    #
    # Unrealized widgets do not have a frame clock.
    def frame_clock : Gdk::FrameClock?
      # gtk_widget_get_frame_clock: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_frame_clock(self)

      # Return value handling

      Gdk::FrameClock.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the horizontal alignment of @widget.
    #
    # For backwards compatibility reasons this method will never return
    # %GTK_ALIGN_BASELINE, but instead it will convert it to
    # %GTK_ALIGN_FILL. Baselines are not supported for horizontal
    # alignment.
    def halign : Gtk::Align
      # gtk_widget_get_halign: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_halign(self)

      # Return value handling

      Gtk::Align.new(_retval)
    end

    # Returns the current value of the `has-tooltip` property.
    def has_tooltip : Bool
      # gtk_widget_get_has_tooltip: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_has_tooltip(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the content height of the widget.
    #
    # This function returns the height passed to its
    # size-allocate implementation, which is the height you
    # should be using in `Gtk::Widget#snapshot`.
    #
    # For pointer events, see `Gtk::Widget#contains`.
    def height : Int32
      # gtk_widget_get_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_height(self)

      # Return value handling

      _retval
    end

    # Gets whether the widget would like any available extra horizontal
    # space.
    #
    # When a user resizes a `GtkWindow`, widgets with expand=TRUE
    # generally receive the extra space. For example, a list or
    # scrollable area or document in your window would often be set to
    # expand.
    #
    # Containers should use `Gtk::Widget#compute_expand` rather
    # than this function, to see whether a widget, or any of its children,
    # has the expand flag set. If any child of a widget wants to
    # expand, the parent may ask to expand also.
    #
    # This function only looks at the widget’s own hexpand flag, rather
    # than computing whether the entire widget tree rooted at this widget
    # wants to expand.
    def hexpand : Bool
      # gtk_widget_get_hexpand: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_hexpand(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether gtk_widget_set_hexpand() has been used
    # to explicitly set the expand flag on this widget.
    #
    # If `Gtk::Widget#hexpand` property is set, then it
    # overrides any computed expand value based on child widgets.
    # If `hexpand` is not set, then the expand value depends on
    # whether any children of the widget would like to expand.
    #
    # There are few reasons to use this function, but it’s here
    # for completeness and consistency.
    def hexpand_set : Bool
      # gtk_widget_get_hexpand_set: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_hexpand_set(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the widgets last child.
    #
    # This API is primarily meant for widget implementations.
    def last_child : Gtk::Widget?
      # gtk_widget_get_last_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_last_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the layout manager used by @widget.
    #
    # See `Gtk::Widget#layout_manager=`.
    def layout_manager : Gtk::LayoutManager?
      # gtk_widget_get_layout_manager: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_layout_manager(self)

      # Return value handling

      Gtk::LayoutManager.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Whether the widget is mapped.
    def mapped : Bool
      # gtk_widget_get_mapped: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_mapped(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the bottom margin of @widget.
    def margin_bottom : Int32
      # gtk_widget_get_margin_bottom: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_margin_bottom(self)

      # Return value handling

      _retval
    end

    # Gets the end margin of @widget.
    def margin_end : Int32
      # gtk_widget_get_margin_end: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_margin_end(self)

      # Return value handling

      _retval
    end

    # Gets the start margin of @widget.
    def margin_start : Int32
      # gtk_widget_get_margin_start: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_margin_start(self)

      # Return value handling

      _retval
    end

    # Gets the top margin of @widget.
    def margin_top : Int32
      # gtk_widget_get_margin_top: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_margin_top(self)

      # Return value handling

      _retval
    end

    # Retrieves the name of a widget.
    #
    # See `Gtk::Widget#name=` for the significance of widget names.
    def name : ::String
      # gtk_widget_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns the nearest `GtkNative` ancestor of @widget.
    #
    # This function will return %NULL if the widget is not
    # contained inside a widget tree with a native ancestor.
    #
    # `GtkNative` widgets will return themselves here.
    def native : Gtk::Native?
      # gtk_widget_get_native: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_native(self)

      # Return value handling

      Gtk::Native__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the widgets next sibling.
    #
    # This API is primarily meant for widget implementations.
    def next_sibling : Gtk::Widget?
      # gtk_widget_get_next_sibling: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_next_sibling(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # #Fetches the requested opacity for this widget.
    #
    # See `Gtk::Widget#opacity=`.
    def opacity : Float64
      # gtk_widget_get_opacity: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_opacity(self)

      # Return value handling

      _retval
    end

    # Returns the widgets overflow value.
    def overflow : Gtk::Overflow
      # gtk_widget_get_overflow: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_overflow(self)

      # Return value handling

      Gtk::Overflow.new(_retval)
    end

    # Gets a `PangoContext` with the appropriate font map, font description,
    # and base direction for this widget.
    #
    # Unlike the context returned by `Gtk::Widget#create_pango_context`,
    # this context is owned by the widget (it can be used until the screen
    # for the widget changes or the widget is removed from its toplevel),
    # and will be updated to match any changes to the widget’s attributes.
    # This can be tracked by listening to changes of the
    # `Gtk::Widget#root` property on the widget.
    def pango_context : Pango::Context
      # gtk_widget_get_pango_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_pango_context(self)

      # Return value handling

      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the parent widget of @widget.
    def parent : Gtk::Widget?
      # gtk_widget_get_parent: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_parent(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the minimum and natural size of a widget, taking
    # into account the widget’s preference for height-for-width management.
    #
    # This is used to retrieve a suitable size by container widgets which do
    # not impose any restrictions on the child placement. It can be used
    # to deduce toplevel window and menu sizes as well as child widgets in
    # free-form containers such as `GtkFixed`.
    #
    # Handle with care. Note that the natural height of a height-for-width
    # widget will generally be a smaller size than the minimum height, since
    # the required height for the natural width is generally smaller than the
    # required height for the minimum width.
    #
    # Use `#gtk_widget_measure` if you want to support baseline alignment.
    def preferred_size : Gtk::Requisition
      # gtk_widget_get_preferred_size: (Method)
      # @minimum_size: (out) (caller-allocates) (optional)
      # @natural_size: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum_size = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      minimum_size = Gtk::Requisition.new
      # Generator::OutArgUsedInReturnPlan
      natural_size = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      natural_size = Gtk::Requisition.new

      # C call
      LibGtk.gtk_widget_get_preferred_size(self, minimum_size, natural_size)

      # Return value handling

      minimum_size
    end

    # Returns the widgets previous sibling.
    #
    # This API is primarily meant for widget implementations.
    def prev_sibling : Gtk::Widget?
      # gtk_widget_get_prev_sibling: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_prev_sibling(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the primary clipboard of @widget.
    #
    # This is a utility function to get the primary clipboard object
    # for the `GdkDisplay` that @widget is using.
    #
    # Note that this function always works, even when @widget is not
    # realized yet.
    def primary_clipboard : Gdk::Clipboard
      # gtk_widget_get_primary_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_primary_clipboard(self)

      # Return value handling

      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    # Determines whether @widget is realized.
    def realized : Bool
      # gtk_widget_get_realized: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_realized(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines whether @widget is always treated as the default widget
    # within its toplevel when it has the focus, even if another widget
    # is the default.
    #
    # See `Gtk::Widget#receives_default=`.
    def receives_default : Bool
      # gtk_widget_get_receives_default: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_receives_default(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether the widget prefers a height-for-width layout
    # or a width-for-height layout.
    #
    # Single-child widgets generally propagate the preference of
    # their child, more complex widgets need to request something
    # either in context of their children or in context of their
    # allocation capabilities.
    def request_mode : Gtk::SizeRequestMode
      # gtk_widget_get_request_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_request_mode(self)

      # Return value handling

      Gtk::SizeRequestMode.new(_retval)
    end

    # Returns the `GtkRoot` widget of @widget.
    #
    # This function will return %NULL if the widget is not contained
    # inside a widget tree with a root widget.
    #
    # `GtkRoot` widgets will return themselves here.
    def root : Gtk::Root?
      # gtk_widget_get_root: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_root(self)

      # Return value handling

      Gtk::Root__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the internal scale factor that maps from window
    # coordinates to the actual device pixels.
    #
    # On traditional systems this is 1, on high density outputs,
    # it can be a higher value (typically 2).
    #
    # See `Gdk::Surface#scale_factor`.
    def scale_factor : Int32
      # gtk_widget_get_scale_factor: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_scale_factor(self)

      # Return value handling

      _retval
    end

    # Returns the widget’s sensitivity.
    #
    # This function returns the value that has been set using
    # `Gtk::Widget#sensitive=`).
    #
    # The effective sensitivity of a widget is however determined
    # by both its own and its parent widget’s sensitivity.
    # See `Gtk::Widget#is_sensitive?`.
    def sensitive : Bool
      # gtk_widget_get_sensitive: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_sensitive(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the settings object holding the settings used for this widget.
    #
    # Note that this function can only be called when the `GtkWidget`
    # is attached to a toplevel, since the settings object is specific
    # to a particular `GdkDisplay`. If you want to monitor the widget for
    # changes in its settings, connect to the `notify::display` signal.
    def settings : Gtk::Settings
      # gtk_widget_get_settings: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_settings(self)

      # Return value handling

      Gtk::Settings.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the content width or height of the widget.
    #
    # Which dimension is returned depends on @orientation.
    #
    # This is equivalent to calling `Gtk::Widget#width`
    # for %GTK_ORIENTATION_HORIZONTAL or `Gtk::Widget#height`
    # for %GTK_ORIENTATION_VERTICAL, but can be used when
    # writing orientation-independent code, such as when
    # implementing `Gtk#Orientable` widgets.
    def size(orientation : Gtk::Orientation) : Int32
      # gtk_widget_get_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_size(self, orientation)

      # Return value handling

      _retval
    end

    # Gets the size request that was explicitly set for the widget using
    # gtk_widget_set_size_request().
    #
    # A value of -1 stored in @width or @height indicates that that
    # dimension has not been set explicitly and the natural requisition
    # of the widget will be used instead. See
    # `Gtk::Widget#size_request=`. To get the size a widget will
    # actually request, call `Gtk::Widget#measure` instead of
    # this function.
    def size_request : Nil
      # gtk_widget_get_size_request: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_widget_get_size_request(self, width, height)

      # Return value handling
    end

    # Returns the widget state as a flag set.
    #
    # It is worth mentioning that the effective %GTK_STATE_FLAG_INSENSITIVE
    # state will be returned, that is, also based on parent insensitivity,
    # even if @widget itself is sensitive.
    #
    # Also note that if you are looking for a way to obtain the
    # `Gtk#StateFlags` to pass to a `Gtk#StyleContext`
    # method, you should look at `Gtk::StyleContext#state`.
    def state_flags : Gtk::StateFlags
      # gtk_widget_get_state_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_state_flags(self)

      # Return value handling

      Gtk::StateFlags.new(_retval)
    end

    # Returns the style context associated to @widget.
    #
    # The returned object is guaranteed to be the same
    # for the lifetime of @widget.
    def style_context : Gtk::StyleContext
      # gtk_widget_get_style_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_style_context(self)

      # Return value handling

      Gtk::StyleContext.new(_retval, GICrystal::Transfer::None)
    end

    # Fetch an object build from the template XML for @widget_type in
    # this @widget instance.
    #
    # This will only report children which were previously declared
    # with `Gtk::WidgetClass#bind_template_child_full` or one of its
    # variants.
    #
    # This function is only meant to be called for code which is private
    # to the @widget_type which declared the child and is meant for language
    # bindings which cannot easily make use of the GObject structure offsets.
    def template_child(widget_type : UInt64, name : ::String) : GObject::Object
      # gtk_widget_get_template_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_template_child(self, widget_type, name)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the contents of the tooltip for @widget.
    #
    # If the tooltip has not been set using
    # `Gtk::Widget#tooltip_markup=`, this
    # function returns %NULL.
    def tooltip_markup : ::String?
      # gtk_widget_get_tooltip_markup: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_tooltip_markup(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the contents of the tooltip for @widget.
    #
    # If the @widget's tooltip was set using
    # `Gtk::Widget#tooltip_markup=`,
    # this function will return the escaped text.
    def tooltip_text : ::String?
      # gtk_widget_get_tooltip_text: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_tooltip_text(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the vertical alignment of @widget.
    def valign : Gtk::Align
      # gtk_widget_get_valign: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_valign(self)

      # Return value handling

      Gtk::Align.new(_retval)
    end

    # Gets whether the widget would like any available extra vertical
    # space.
    #
    # See `Gtk::Widget#hexpand` for more detail.
    def vexpand : Bool
      # gtk_widget_get_vexpand: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_vexpand(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether gtk_widget_set_vexpand() has been used to
    # explicitly set the expand flag on this widget.
    #
    # See `Gtk::Widget#hexpand_set` for more detail.
    def vexpand_set : Bool
      # gtk_widget_get_vexpand_set: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_vexpand_set(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines whether the widget is visible.
    #
    # If you want to take into account whether the widget’s
    # parent is also marked as visible, use
    # `Gtk::Widget#is_visible?` instead.
    #
    # This function does not check if the widget is
    # obscured in any way.
    #
    # See `Gtk::Widget#visible=`.
    def visible : Bool
      # gtk_widget_get_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_visible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the content width of the widget.
    #
    # This function returns the width passed to its
    # size-allocate implementation, which is the width you
    # should be using in `Gtk::Widget#snapshot`.
    #
    # For pointer events, see `Gtk::Widget#contains`.
    def width : Int32
      # gtk_widget_get_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_get_width(self)

      # Return value handling

      _retval
    end

    # Causes @widget to have the keyboard focus for the `GtkWindow` it's inside.
    #
    # If @widget is not focusable, or its `Gtk::Widget#grab_focus`
    # implementation cannot transfer the focus to a descendant of @widget
    # that is focusable, it will not take focus and %FALSE will be returned.
    #
    # Calling `Gtk::Widget#grab_focus` on an already focused widget
    # is allowed, should not have an effect, and return %TRUE.
    def grab_focus : Bool
      # gtk_widget_grab_focus: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_grab_focus(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether @css_class is currently applied to @widget.
    def has_css_class(css_class : ::String) : Bool
      # gtk_widget_has_css_class: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_has_css_class(self, css_class)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines whether @widget is the current default widget
    # within its toplevel.
    def has_default : Bool
      # gtk_widget_has_default: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_has_default(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines if the widget has the global input focus.
    #
    # See `Gtk::Widget#is_focus?` for the difference between
    # having the global input focus, and only having the focus
    # within a toplevel.
    def has_focus : Bool
      # gtk_widget_has_focus: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_has_focus(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines if the widget should show a visible indication that
    # it has the global input focus.
    #
    # This is a convenience function that takes into account whether
    # focus indication should currently be shown in the toplevel window
    # of @widget. See `Gtk::Window#focus_visible` for more
    # information about focus indication.
    #
    # To find out if the widget has the global input focus, use
    # `Gtk::Widget#has_focus`.
    def has_visible_focus : Bool
      # gtk_widget_has_visible_focus: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_has_visible_focus(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reverses the effects of gtk_widget_show().
    #
    # This is causing the widget to be hidden (invisible to the user).
    def hide : Nil
      # gtk_widget_hide: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_hide(self)

      # Return value handling
    end

    # Returns whether the widget is currently being destroyed.
    #
    # This information can sometimes be used to avoid doing
    # unnecessary work.
    def in_destruction : Bool
      # gtk_widget_in_destruction: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_in_destruction(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates and initializes child widgets defined in templates.
    #
    # This function must be called in the instance initializer
    # for any class which assigned itself a template using
    # `Gtk::WidgetClass#template=`.
    #
    # It is important to call this function in the instance initializer
    # of a `GtkWidget` subclass and not in `GObject.constructed()` or
    # `GObject.constructor()` for two reasons:
    #
    #  - derived widgets will assume that the composite widgets
    #    defined by its parent classes have been created in their
    #    relative instance initializers
    #  - when calling `g_object_new()` on a widget with composite templates,
    #    it’s important to build the composite widgets before the construct
    #    properties are set. Properties passed to `g_object_new()` should
    #    take precedence over properties set in the private template XML
    #
    # A good rule of thumb is to call this function as the first thing in
    # an instance initialization function.
    def init_template : Nil
      # gtk_widget_init_template: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_init_template(self)

      # Return value handling
    end

    # Inserts @group into @widget.
    #
    # Children of @widget that implement `Gtk#Actionable` can
    # then be associated with actions in @group by setting their
    # “action-name” to @prefix.`action-name`.
    #
    # Note that inheritance is defined for individual actions. I.e.
    # even if you insert a group with prefix @prefix, actions with
    # the same prefix will still be inherited from the parent, unless
    # the group contains an action with the same name.
    #
    # If @group is %NULL, a previously inserted group for @name is
    # removed from @widget.
    def insert_action_group(name : ::String, group : Gio::ActionGroup?) : Nil
      # gtk_widget_insert_action_group: (Method)
      # @group: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      group = if group.nil?
                Pointer(Void).null
              else
                group.to_unsafe
              end

      # C call
      LibGtk.gtk_widget_insert_action_group(self, name, group)

      # Return value handling
    end

    # Inserts @widget into the child widget list of @parent.
    #
    # It will be placed after @previous_sibling, or at the beginning if
    # @previous_sibling is %NULL.
    #
    # After calling this function, `gtk_widget_get_prev_sibling(widget)`
    # will return @previous_sibling.
    #
    # If @parent is already set as the parent widget of @widget, this
    # function can also be used to reorder @widget in the child widget
    # list of @parent.
    #
    # This API is primarily meant for widget implementations; if you are
    # just using a widget, you *must* use its own API for adding children.
    def insert_after(parent : Gtk::Widget, previous_sibling : Gtk::Widget?) : Nil
      # gtk_widget_insert_after: (Method)
      # @previous_sibling: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      previous_sibling = if previous_sibling.nil?
                           Pointer(Void).null
                         else
                           previous_sibling.to_unsafe
                         end

      # C call
      LibGtk.gtk_widget_insert_after(self, parent, previous_sibling)

      # Return value handling
    end

    # Inserts @widget into the child widget list of @parent.
    #
    # It will be placed before @next_sibling, or at the end if
    # @next_sibling is %NULL.
    #
    # After calling this function, `gtk_widget_get_next_sibling(widget)`
    # will return @next_sibling.
    #
    # If @parent is already set as the parent widget of @widget, this function
    # can also be used to reorder @widget in the child widget list of @parent.
    #
    # This API is primarily meant for widget implementations; if you are
    # just using a widget, you *must* use its own API for adding children.
    def insert_before(parent : Gtk::Widget, next_sibling : Gtk::Widget?) : Nil
      # gtk_widget_insert_before: (Method)
      # @next_sibling: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      next_sibling = if next_sibling.nil?
                       Pointer(Void).null
                     else
                       next_sibling.to_unsafe
                     end

      # C call
      LibGtk.gtk_widget_insert_before(self, parent, next_sibling)

      # Return value handling
    end

    # Determines whether @widget is somewhere inside @ancestor,
    # possibly with intermediate containers.
    def is_ancestor(ancestor : Gtk::Widget) : Bool
      # gtk_widget_is_ancestor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_is_ancestor(self, ancestor)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines whether @widget can be drawn to.
    #
    # A widget can be drawn if it is mapped and visible.
    def is_drawable : Bool
      # gtk_widget_is_drawable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_is_drawable(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines if the widget is the focus widget within its
    # toplevel.
    #
    # This does not mean that the [property@Gtk.Widget:has-focus]
    # property is necessarily set; [property@Gtk.Widget:has-focus]
    # will only be set if the toplevel widget additionally has the
    # global input focus.
    def is_focus : Bool
      # gtk_widget_is_focus: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_is_focus(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the widget’s effective sensitivity.
    #
    # This means it is sensitive itself and also its
    # parent widget is sensitive.
    def is_sensitive : Bool
      # gtk_widget_is_sensitive: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_is_sensitive(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines whether the widget and all its parents are marked as
    # visible.
    #
    # This function does not check if the widget is obscured in any way.
    #
    # See also `Gtk::Widget#visible` and
    # `Gtk::Widget#visible=`.
    def is_visible : Bool
      # gtk_widget_is_visible: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_is_visible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emits the `::keynav-failed` signal on the widget.
    #
    # This function should be called whenever keyboard navigation
    # within a single widget hits a boundary.
    #
    # The return value of this function should be interpreted
    # in a way similar to the return value of
    # `Gtk::Widget#child_focus`. When %TRUE is returned,
    # stay in the widget, the failed keyboard  navigation is OK
    # and/or there is nowhere we can/should move the focus to.
    # When %FALSE is returned, the caller should continue with
    # keyboard navigation outside the widget, e.g. by calling
    # `Gtk::Widget#child_focus` on the widget’s toplevel.
    #
    # The default [signal@Gtk.Widget::keynav-failed] handler returns
    # %FALSE for %GTK_DIR_TAB_FORWARD and %GTK_DIR_TAB_BACKWARD.
    # For the other values of `GtkDirectionType` it returns %TRUE.
    #
    # Whenever the default handler returns %TRUE, it also calls
    # `Gtk::Widget#error_bell` to notify the user of the
    # failed keyboard navigation.
    #
    # A use case for providing an own implementation of ::keynav-failed
    # (either by connecting to it or by overriding it) would be a row of
    # `Gtk#Entry` widgets where the user should be able to navigate
    # the entire row with the cursor keys, as e.g. known from user
    # interfaces that require entering license keys.
    def keynav_failed(direction : Gtk::DirectionType) : Bool
      # gtk_widget_keynav_failed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_keynav_failed(self, direction)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the widgets for which this widget is the target of a
    # mnemonic.
    #
    # Typically, these widgets will be labels. See, for example,
    # `Gtk::Label#mnemonic_widget=`.
    #
    # The widgets in the list are not individually referenced.
    # If you want to iterate through the list and perform actions
    # involving callbacks that might destroy the widgets, you
    # must call `g_list_foreach (result, (GFunc)g_object_ref, NULL)`
    # first, and then unref all the widgets afterwards.
    def list_mnemonic_labels : GLib::List
      # gtk_widget_list_mnemonic_labels: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_widget_list_mnemonic_labels(self)

      # Return value handling

      GLib::List(Gtk::Widget).new(_retval, GICrystal::Transfer::Container)
    end

    # Causes a widget to be mapped if it isn’t already.
    #
    # This function is only for use in widget implementations.
    def map : Nil
      # gtk_widget_map: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_map(self)

      # Return value handling
    end

    # Measures @widget in the orientation @orientation and for the given @for_size.
    #
    # As an example, if @orientation is %GTK_ORIENTATION_HORIZONTAL and @for_size
    # is 300, this functions will compute the minimum and natural width of @widget
    # if it is allocated at a height of 300 pixels.
    #
    # See [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
    # a more details on implementing `GtkWidgetClass.measure()`.
    def measure(orientation : Gtk::Orientation, for_size : Int32) : Nil
      # gtk_widget_measure: (Method)
      # @minimum: (out) (transfer full) (optional)
      # @natural: (out) (transfer full) (optional)
      # @minimum_baseline: (out) (transfer full) (optional)
      # @natural_baseline: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      minimum = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      natural = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      minimum_baseline = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      natural_baseline = Pointer(Int32).null

      # C call
      LibGtk.gtk_widget_measure(self, orientation, for_size, minimum, natural, minimum_baseline, natural_baseline)

      # Return value handling
    end

    # Emits the ::mnemonic-activate signal.
    #
    # See [signal@Gtk.Widget::mnemonic-activate].
    def mnemonic_activate(group_cycling : Bool) : Bool
      # gtk_widget_mnemonic_activate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_mnemonic_activate(self, group_cycling)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns a `GListModel` to track the children of @widget.
    #
    # Calling this function will enable extra internal bookkeeping
    # to track children and emit signals on the returned listmodel.
    # It may slow down operations a lot.
    #
    # Applications should try hard to avoid calling this function
    # because of the slowdowns.
    def observe_children : Gio::ListModel
      # gtk_widget_observe_children: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_widget_observe_children(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns a `GListModel` to track the `Gtk#EventController`s
    # of @widget.
    #
    # Calling this function will enable extra internal bookkeeping
    # to track controllers and emit signals on the returned listmodel.
    # It may slow down operations a lot.
    #
    # Applications should try hard to avoid calling this function
    # because of the slowdowns.
    def observe_controllers : Gio::ListModel
      # gtk_widget_observe_controllers: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_widget_observe_controllers(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Finds the descendant of @widget closest to the point (@x, @y).
    #
    # The point must be given in widget coordinates, so (0, 0) is assumed
    # to be the top left of @widget's content area.
    #
    # Usually widgets will return %NULL if the given coordinate is not
    # contained in @widget checked via `Gtk::Widget#contains`.
    # Otherwise they will recursively try to find a child that does
    # not return %NULL. Widgets are however free to customize their
    # picking algorithm.
    #
    # This function is used on the toplevel to determine the widget
    # below the mouse cursor for purposes of hover highlighting and
    # delivering events.
    def pick(x : Float64, y : Float64, flags : Gtk::PickFlags) : Gtk::Widget?
      # gtk_widget_pick: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_pick(self, x, y, flags)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Flags the widget for a rerun of the `Gtk::Widget#size_allocate`
    # function.
    #
    # Use this function instead of `Gtk::Widget#queue_resize`
    # when the @widget's size request didn't change but it wants to
    # reposition its contents.
    #
    # An example user of this function is `Gtk::Widget#halign=`.
    #
    # This function is only for use in widget implementations.
    def queue_allocate : Nil
      # gtk_widget_queue_allocate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_queue_allocate(self)

      # Return value handling
    end

    # Schedules this widget to be redrawn in the paint phase
    # of the current or the next frame.
    #
    # This means @widget's `Gtk::Widget#snapshot`
    # implementation will be called.
    def queue_draw : Nil
      # gtk_widget_queue_draw: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_queue_draw(self)

      # Return value handling
    end

    # Flags a widget to have its size renegotiated.
    #
    # This should be called when a widget for some reason has a new
    # size request. For example, when you change the text in a
    # `Gtk#Label`, the label queues a resize to ensure there’s
    # enough space for the new text.
    #
    # Note that you cannot call gtk_widget_queue_resize() on a widget
    # from inside its implementation of the `Gtk::Widget#size_allocate`
    # virtual method. Calls to gtk_widget_queue_resize() from inside
    # `Gtk::Widget#size_allocate` will be silently ignored.
    #
    # This function is only for use in widget implementations.
    def queue_resize : Nil
      # gtk_widget_queue_resize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_queue_resize(self)

      # Return value handling
    end

    # Creates the GDK resources associated with a widget.
    #
    # Normally realization happens implicitly; if you show a widget
    # and all its parent containers, then the widget will be realized
    # and mapped automatically.
    #
    # Realizing a widget requires all the widget’s parent widgets to be
    # realized; calling this function realizes the widget’s parents
    # in addition to @widget itself. If a widget is not yet inside a
    # toplevel window when you realize it, bad things will happen.
    #
    # This function is primarily used in widget implementations, and
    # isn’t very useful otherwise. Many times when you think you might
    # need it, a better approach is to connect to a signal that will be
    # called after the widget is realized automatically, such as
    # `Gtk::Widget::#realize`.
    def realize : Nil
      # gtk_widget_realize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_realize(self)

      # Return value handling
    end

    # Removes @controller from @widget, so that it doesn't process
    # events anymore.
    #
    # It should not be used again.
    #
    # Widgets will remove all event controllers automatically when they
    # are destroyed, there is normally no need to call this function.
    def remove_controller(controller : Gtk::EventController) : Nil
      # gtk_widget_remove_controller: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_remove_controller(self, controller)

      # Return value handling
    end

    # Removes a style from @widget.
    #
    # After this, the style of @widget will stop matching for @css_class.
    def remove_css_class(css_class : ::String) : Nil
      # gtk_widget_remove_css_class: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_remove_css_class(self, css_class)

      # Return value handling
    end

    # Removes a widget from the list of mnemonic labels for this widget.
    #
    # See `Gtk::Widget#list_mnemonic_labels`. The widget must
    # have previously been added to the list with
    # `Gtk::Widget#add_mnemonic_label`.
    def remove_mnemonic_label(label : Gtk::Widget) : Nil
      # gtk_widget_remove_mnemonic_label: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_remove_mnemonic_label(self, label)

      # Return value handling
    end

    # Removes a tick callback previously registered with
    # gtk_widget_add_tick_callback().
    def remove_tick_callback(id : UInt32) : Nil
      # gtk_widget_remove_tick_callback: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_remove_tick_callback(self, id)

      # Return value handling
    end

    # Specifies whether the input focus can enter the widget
    # or any of its children.
    #
    # Applications should set @can_focus to %FALSE to mark a
    # widget as for pointer/touch use only.
    #
    # Note that having @can_focus be %TRUE is only one of the
    # necessary conditions for being focusable. A widget must
    # also be sensitive and focusable and not have an ancestor
    # that is marked as not can-focus in order to receive input
    # focus.
    #
    # See `Gtk::Widget#grab_focus` for actually setting
    # the input focus on a widget.
    def can_focus=(can_focus : Bool) : Nil
      # gtk_widget_set_can_focus: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_can_focus(self, can_focus)

      # Return value handling
    end

    # Sets whether @widget can be the target of pointer events.
    def can_target=(can_target : Bool) : Nil
      # gtk_widget_set_can_target: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_can_target(self, can_target)

      # Return value handling
    end

    # Sets whether @widget should be mapped along with its parent.
    #
    # The child visibility can be set for widget before it is added
    # to a container with `Gtk::Widget#parent=`, to avoid
    # mapping children unnecessary before immediately unmapping them.
    # However it will be reset to its default state of %TRUE when the
    # widget is removed from a container.
    #
    # Note that changing the child visibility of a widget does not
    # queue a resize on the widget. Most of the time, the size of
    # a widget is computed from all visible children, whether or
    # not they are mapped. If this is not the case, the container
    # can queue a resize itself.
    #
    # This function is only useful for container implementations
    # and should never be called by an application.
    def child_visible=(child_visible : Bool) : Nil
      # gtk_widget_set_child_visible: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_child_visible(self, child_visible)

      # Return value handling
    end

    # Clear all style classes applied to @widget
    # and replace them with @classes.
    def css_classes=(classes : Enumerable(::String)) : Nil
      # gtk_widget_set_css_classes: (Method | Setter)
      # @classes: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      classes = classes.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_widget_set_css_classes(self, classes)

      # Return value handling
    end

    # Sets the cursor to be shown when pointer devices point
    # towards @widget.
    #
    # If the @cursor is NULL, @widget will use the cursor
    # inherited from the parent widget.
    def cursor=(cursor : Gdk::Cursor?) : Nil
      # gtk_widget_set_cursor: (Method | Setter)
      # @cursor: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cursor = if cursor.nil?
                 Pointer(Void).null
               else
                 cursor.to_unsafe
               end

      # C call
      LibGtk.gtk_widget_set_cursor(self, cursor)

      # Return value handling
    end

    # Sets a named cursor to be shown when pointer devices point
    # towards @widget.
    #
    # This is a utility function that creates a cursor via
    # `Gdk::Cursor#new_from_name` and then sets it on @widget
    # with `Gtk::Widget#cursor=`. See those functions for
    # details.
    #
    # On top of that, this function allows @name to be %NULL, which
    # will do the same as calling `Gtk::Widget#cursor=`
    # with a %NULL cursor.
    def cursor_from_name=(name : ::String?) : Nil
      # gtk_widget_set_cursor_from_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_widget_set_cursor_from_name(self, name)

      # Return value handling
    end

    # Sets the reading direction on a particular widget.
    #
    # This direction controls the primary direction for widgets
    # containing text, and also the direction in which the children
    # of a container are packed. The ability to set the direction is
    # present in order so that correct localization into languages with
    # right-to-left reading directions can be done. Generally, applications
    # will let the default reading direction present, except for containers
    # where the containers are arranged in an order that is explicitly
    # visual rather than logical (such as buttons for text justification).
    #
    # If the direction is set to %GTK_TEXT_DIR_NONE, then the value
    # set by `Gtk::Widget#default_direction=` will be used.
    def direction=(dir : Gtk::TextDirection) : Nil
      # gtk_widget_set_direction: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_direction(self, dir)

      # Return value handling
    end

    # Set @child as the current focus child of @widget.
    #
    # This function is only suitable for widget implementations.
    # If you want a certain widget to get the input focus, call
    # `Gtk::Widget#grab_focus` on it.
    def focus_child=(child : Gtk::Widget?) : Nil
      # gtk_widget_set_focus_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_widget_set_focus_child(self, child)

      # Return value handling
    end

    # Sets whether the widget should grab focus when it is clicked
    # with the mouse.
    #
    # Making mouse clicks not grab focus is useful in places like
    # toolbars where you don’t want the keyboard focus removed from
    # the main area of the application.
    def focus_on_click=(focus_on_click : Bool) : Nil
      # gtk_widget_set_focus_on_click: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_focus_on_click(self, focus_on_click)

      # Return value handling
    end

    # Specifies whether @widget can own the input focus.
    #
    # Widget implementations should set @focusable to %TRUE in
    # their init() function if they want to receive keyboard input.
    #
    # Note that having @focusable be %TRUE is only one of the
    # necessary conditions for being focusable. A widget must
    # also be sensitive and can-focus and not have an ancestor
    # that is marked as not can-focus in order to receive input
    # focus.
    #
    # See `Gtk::Widget#grab_focus` for actually setting
    # the input focus on a widget.
    def focusable=(focusable : Bool) : Nil
      # gtk_widget_set_focusable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_focusable(self, focusable)

      # Return value handling
    end

    # Sets the font map to use for Pango rendering.
    #
    # The font map is the object that is used to look up fonts.
    # Setting a custom font map can be useful in special situations,
    # e.g. when you need to add application-specific fonts to the set
    # of available fonts.
    #
    # When not set, the widget will inherit the font map from its parent.
    def font_map=(font_map : Pango::FontMap?) : Nil
      # gtk_widget_set_font_map: (Method)
      # @font_map: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      font_map = if font_map.nil?
                   Pointer(Void).null
                 else
                   font_map.to_unsafe
                 end

      # C call
      LibGtk.gtk_widget_set_font_map(self, font_map)

      # Return value handling
    end

    # Sets the `cairo_font_options_t` used for Pango rendering
    # in this widget.
    #
    # When not set, the default font options for the `GdkDisplay`
    # will be used.
    def font_options=(options : Cairo::FontOptions?) : Nil
      # gtk_widget_set_font_options: (Method)
      # @options: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      options = if options.nil?
                  Pointer(Void).null
                else
                  options.to_unsafe
                end

      # C call
      LibGtk.gtk_widget_set_font_options(self, options)

      # Return value handling
    end

    # Sets the horizontal alignment of @widget.
    def halign=(align : Gtk::Align) : Nil
      # gtk_widget_set_halign: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_halign(self, align)

      # Return value handling
    end

    # Sets the `has-tooltip` property on @widget to @has_tooltip.
    def has_tooltip=(has_tooltip : Bool) : Nil
      # gtk_widget_set_has_tooltip: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_has_tooltip(self, has_tooltip)

      # Return value handling
    end

    # Sets whether the widget would like any available extra horizontal
    # space.
    #
    # When a user resizes a `GtkWindow`, widgets with expand=TRUE
    # generally receive the extra space. For example, a list or
    # scrollable area or document in your window would often be set to
    # expand.
    #
    # Call this function to set the expand flag if you would like your
    # widget to become larger horizontally when the window has extra
    # room.
    #
    # By default, widgets automatically expand if any of their children
    # want to expand. (To see if a widget will automatically expand given
    # its current children and state, call `Gtk::Widget#compute_expand`.
    # A container can decide how the expandability of children affects the
    # expansion of the container by overriding the compute_expand virtual
    # method on `GtkWidget`.).
    #
    # Setting hexpand explicitly with this function will override the
    # automatic expand behavior.
    #
    # This function forces the widget to expand or not to expand,
    # regardless of children.  The override occurs because
    # `Gtk::Widget#hexpand=` sets the hexpand-set property (see
    # `Gtk::Widget#hexpand_set=`) which causes the widget’s hexpand
    # value to be used, rather than looking at children and widget state.
    def hexpand=(expand : Bool) : Nil
      # gtk_widget_set_hexpand: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_hexpand(self, expand)

      # Return value handling
    end

    # Sets whether the hexpand flag will be used.
    #
    # The [property@Gtk.Widget:hexpand-set] property will be set
    # automatically when you call `Gtk::Widget#hexpand=`
    # to set hexpand, so the most likely reason to use this function
    # would be to unset an explicit expand flag.
    #
    # If hexpand is set, then it overrides any computed
    # expand value based on child widgets. If hexpand is not
    # set, then the expand value depends on whether any
    # children of the widget would like to expand.
    #
    # There are few reasons to use this function, but it’s here
    # for completeness and consistency.
    def hexpand_set=(set : Bool) : Nil
      # gtk_widget_set_hexpand_set: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_hexpand_set(self, set)

      # Return value handling
    end

    # Sets the layout manager delegate instance that provides an
    # implementation for measuring and allocating the children of @widget.
    def layout_manager=(layout_manager : Gtk::LayoutManager?) : Nil
      # gtk_widget_set_layout_manager: (Method | Setter)
      # @layout_manager: (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      layout_manager = if layout_manager.nil?
                         Pointer(Void).null
                       else
                         layout_manager.to_unsafe
                       end

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(layout_manager)

      # C call
      LibGtk.gtk_widget_set_layout_manager(self, layout_manager)

      # Return value handling
    end

    # Sets the bottom margin of @widget.
    def margin_bottom=(margin : Int32) : Nil
      # gtk_widget_set_margin_bottom: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_margin_bottom(self, margin)

      # Return value handling
    end

    # Sets the end margin of @widget.
    def margin_end=(margin : Int32) : Nil
      # gtk_widget_set_margin_end: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_margin_end(self, margin)

      # Return value handling
    end

    # Sets the start margin of @widget.
    def margin_start=(margin : Int32) : Nil
      # gtk_widget_set_margin_start: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_margin_start(self, margin)

      # Return value handling
    end

    # Sets the top margin of @widget.
    def margin_top=(margin : Int32) : Nil
      # gtk_widget_set_margin_top: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_margin_top(self, margin)

      # Return value handling
    end

    # Sets a widgets name.
    #
    # Setting a name allows you to refer to the widget from a
    # CSS file. You can apply a style to widgets with a particular name
    # in the CSS file. See the documentation for the CSS syntax (on the
    # same page as the docs for `Gtk#StyleContext`.
    #
    # Note that the CSS syntax has certain special characters to delimit
    # and represent elements in a selector (period, #, >, *...), so using
    # these will make your widget impossible to match by name. Any combination
    # of alphanumeric symbols, dashes and underscores will suffice.
    def name=(name : ::String) : Nil
      # gtk_widget_set_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_name(self, name)

      # Return value handling
    end

    # Request the @widget to be rendered partially transparent.
    #
    # An opacity of 0 is fully transparent and an opacity of 1
    # is fully opaque.
    #
    # Opacity works on both toplevel widgets and child widgets, although
    # there are some limitations: For toplevel widgets, applying opacity
    # depends on the capabilities of the windowing system. On X11, this
    # has any effect only on X displays with a compositing manager,
    # see gdk_display_is_composited(). On Windows and Wayland it should
    # always work, although setting a window’s opacity after the window
    # has been shown may cause some flicker.
    #
    # Note that the opacity is inherited through inclusion — if you set
    # a toplevel to be partially translucent, all of its content will
    # appear translucent, since it is ultimatively rendered on that
    # toplevel. The opacity value itself is not inherited by child
    # widgets (since that would make widgets deeper in the hierarchy
    # progressively more translucent). As a consequence, `Gtk#Popover`s
    # and other `Gtk#Native` widgets with their own surface will use their
    # own opacity value, and thus by default appear non-translucent,
    # even if they are attached to a toplevel that is translucent.
    def opacity=(opacity : Float64) : Nil
      # gtk_widget_set_opacity: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_opacity(self, opacity)

      # Return value handling
    end

    # Sets how @widget treats content that is drawn outside the
    # widget's content area.
    #
    # See the definition of `Gtk#Overflow` for details.
    #
    # This setting is provided for widget implementations and
    # should not be used by application code.
    #
    # The default value is %GTK_OVERFLOW_VISIBLE.
    def overflow=(overflow : Gtk::Overflow) : Nil
      # gtk_widget_set_overflow: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_overflow(self, overflow)

      # Return value handling
    end

    # Sets @parent as the parent widget of @widget.
    #
    # This takes care of details such as updating the state and style
    # of the child to reflect its new location and resizing the parent.
    # The opposite function is `Gtk::Widget#unparent`.
    #
    # This function is useful only when implementing subclasses of
    # `GtkWidget`.
    def parent=(parent : Gtk::Widget) : Nil
      # gtk_widget_set_parent: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_parent(self, parent)

      # Return value handling
    end

    # Specifies whether @widget will be treated as the default
    # widget within its toplevel when it has the focus, even if
    # another widget is the default.
    def receives_default=(receives_default : Bool) : Nil
      # gtk_widget_set_receives_default: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_receives_default(self, receives_default)

      # Return value handling
    end

    # Sets the sensitivity of a widget.
    #
    # A widget is sensitive if the user can interact with it.
    # Insensitive widgets are “grayed out” and the user can’t
    # interact with them. Insensitive widgets are known as
    # “inactive”, “disabled”, or “ghosted” in some other toolkits.
    def sensitive=(sensitive : Bool) : Nil
      # gtk_widget_set_sensitive: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_sensitive(self, sensitive)

      # Return value handling
    end

    # Sets the minimum size of a widget.
    #
    # That is, the widget’s size request will be at least @width
    # by @height. You can use this function to force a widget to
    # be larger than it normally would be.
    #
    # In most cases, `Gtk::Window#default_size=` is a better
    # choice for toplevel windows than this function; setting the default
    # size will still allow users to shrink the window. Setting the size
    # request will force them to leave the window at least as large as
    # the size request.
    #
    # Note the inherent danger of setting any fixed size - themes,
    # translations into other languages, different fonts, and user action
    # can all change the appropriate size for a given widget. So, it's
    # basically impossible to hardcode a size that will always be
    # correct.
    #
    # The size request of a widget is the smallest size a widget can
    # accept while still functioning well and drawing itself correctly.
    # However in some strange cases a widget may be allocated less than
    # its requested size, and in many cases a widget may be allocated more
    # space than it requested.
    #
    # If the size request in a given direction is -1 (unset), then
    # the “natural” size request of the widget will be used instead.
    #
    # The size request set here does not include any margin from the
    # properties
    # [property@Gtk.Widget:margin-start],
    # [property@Gtk.Widget:margin-end],
    # [property@Gtk.Widget:margin-top], and
    # [property@Gtk.Widget:margin-bottom], but it does include pretty
    # much all other padding or border properties set by any subclass
    # of `GtkWidget`.
    def set_size_request(width : Int32, height : Int32) : Nil
      # gtk_widget_set_size_request: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_size_request(self, width, height)

      # Return value handling
    end

    # Turns on flag values in the current widget state.
    #
    # Typical widget states are insensitive, prelighted, etc.
    #
    # This function accepts the values %GTK_STATE_FLAG_DIR_LTR and
    # %GTK_STATE_FLAG_DIR_RTL but ignores them. If you want to set
    # the widget's direction, use `Gtk::Widget#direction=`.
    #
    # This function is for use in widget implementations.
    def set_state_flags(flags : Gtk::StateFlags, clear : Bool) : Nil
      # gtk_widget_set_state_flags: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_state_flags(self, flags, clear)

      # Return value handling
    end

    # Sets @markup as the contents of the tooltip, which is marked
    # up with Pango markup.
    #
    # This function will take care of setting the
    # [property@Gtk.Widget:has-tooltip] as a side effect, and of the
    # default handler for the [signal@Gtk.Widget::query-tooltip] signal.
    #
    # See also `Gtk::Tooltip#markup=`.
    def tooltip_markup=(markup : ::String?) : Nil
      # gtk_widget_set_tooltip_markup: (Method | Setter)
      # @markup: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      markup = if markup.nil?
                 Pointer(LibC::Char).null
               else
                 markup.to_unsafe
               end

      # C call
      LibGtk.gtk_widget_set_tooltip_markup(self, markup)

      # Return value handling
    end

    # Sets @text as the contents of the tooltip.
    #
    # If @text contains any markup, it will be escaped.
    #
    # This function will take care of setting
    # [property@Gtk.Widget:has-tooltip] as a side effect,
    # and of the default handler for the
    # [signal@Gtk.Widget::query-tooltip] signal.
    #
    # See also `Gtk::Tooltip#text=`.
    def tooltip_text=(text : ::String?) : Nil
      # gtk_widget_set_tooltip_text: (Method | Setter)
      # @text: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibGtk.gtk_widget_set_tooltip_text(self, text)

      # Return value handling
    end

    # Sets the vertical alignment of @widget.
    def valign=(align : Gtk::Align) : Nil
      # gtk_widget_set_valign: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_valign(self, align)

      # Return value handling
    end

    # Sets whether the widget would like any available extra vertical
    # space.
    #
    # See `Gtk::Widget#hexpand=` for more detail.
    def vexpand=(expand : Bool) : Nil
      # gtk_widget_set_vexpand: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_vexpand(self, expand)

      # Return value handling
    end

    # Sets whether the vexpand flag will be used.
    #
    # See `Gtk::Widget#hexpand_set=` for more detail.
    def vexpand_set=(set : Bool) : Nil
      # gtk_widget_set_vexpand_set: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_vexpand_set(self, set)

      # Return value handling
    end

    # Sets the visibility state of @widget.
    #
    # Note that setting this to %TRUE doesn’t mean the widget is
    # actually viewable, see `Gtk::Widget#visible`.
    #
    # This function simply calls `Gtk::Widget#show` or
    # `Gtk::Widget#hide` but is nicer to use when the
    # visibility of the widget depends on some condition.
    def visible=(visible : Bool) : Nil
      # gtk_widget_set_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_set_visible(self, visible)

      # Return value handling
    end

    # Returns whether @widget should contribute to
    # the measuring and allocation of its parent.
    #
    # This is %FALSE for invisible children, but also
    # for children that have their own surface.
    def should_layout : Bool
      # gtk_widget_should_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_widget_should_layout(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Flags a widget to be displayed.
    #
    # Any widget that isn’t shown will not appear on the screen.
    #
    # Remember that you have to show the containers containing a widget,
    # in addition to the widget itself, before it will appear onscreen.
    #
    # When a toplevel container is shown, it is immediately realized and
    # mapped; other shown widgets are realized and mapped when their
    # toplevel container is realized and mapped.
    def show : Nil
      # gtk_widget_show: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_show(self)

      # Return value handling
    end

    # Allocates widget with a transformation that translates
    # the origin to the position in @allocation.
    #
    # This is a simple form of `Gtk::Widget#allocate`.
    def size_allocate(allocation : Gdk::Rectangle, baseline : Int32) : Nil
      # gtk_widget_size_allocate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_size_allocate(self, allocation, baseline)

      # Return value handling
    end

    # Snapshot the a child of @widget.
    #
    # When a widget receives a call to the snapshot function,
    # it must send synthetic `Gtk::Widget#snapshot` calls
    # to all children. This function provides a convenient way
    # of doing this. A widget, when it receives a call to its
    # `Gtk::Widget#snapshot` function, calls
    # gtk_widget_snapshot_child() once for each child, passing in
    # the @snapshot the widget received.
    #
    # gtk_widget_snapshot_child() takes care of translating the origin of
    # @snapshot, and deciding whether the child needs to be snapshot.
    #
    # This function does nothing for children that implement `GtkNative`.
    def snapshot_child(child : Gtk::Widget, snapshot : Gtk::Snapshot) : Nil
      # gtk_widget_snapshot_child: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_snapshot_child(self, child, snapshot)

      # Return value handling
    end

    # Translate coordinates relative to @src_widget’s allocation
    # to coordinates relative to @dest_widget’s allocations.
    #
    # In order to perform this operation, both widget must share
    # a common ancestor.
    def translate_coordinates(dest_widget : Gtk::Widget, src_x : Float64, src_y : Float64) : Bool
      # gtk_widget_translate_coordinates: (Method)
      # @dest_x: (out) (transfer full) (optional)
      # @dest_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      dest_x = Pointer(Float64).null
      # Generator::OutArgUsedInReturnPlan
      dest_y = Pointer(Float64).null

      # C call
      _retval = LibGtk.gtk_widget_translate_coordinates(self, dest_widget, src_x, src_y, dest_x, dest_y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Triggers a tooltip query on the display where the toplevel
    # of @widget is located.
    def trigger_tooltip_query : Nil
      # gtk_widget_trigger_tooltip_query: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_trigger_tooltip_query(self)

      # Return value handling
    end

    # Causes a widget to be unmapped if it’s currently mapped.
    #
    # This function is only for use in widget implementations.
    def unmap : Nil
      # gtk_widget_unmap: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_unmap(self)

      # Return value handling
    end

    # Dissociate @widget from its parent.
    #
    # This function is only for use in widget implementations,
    # typically in dispose.
    def unparent : Nil
      # gtk_widget_unparent: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_unparent(self)

      # Return value handling
    end

    # Causes a widget to be unrealized (frees all GDK resources
    # associated with the widget).
    #
    # This function is only useful in widget implementations.
    def unrealize : Nil
      # gtk_widget_unrealize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_unrealize(self)

      # Return value handling
    end

    # Turns off flag values for the current widget state.
    #
    # See `Gtk::Widget#state_flags=`.
    #
    # This function is for use in widget implementations.
    def unset_state_flags(flags : Gtk::StateFlags) : Nil
      # gtk_widget_unset_state_flags: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_widget_unset_state_flags(self, flags)

      # Return value handling
    end

    # Signals that all holders of a reference to the widget should release
    # the reference that they hold.
    #
    # May result in finalization of the widget if all references are released.
    #
    # This signal is not suitable for saving widget state.
    struct DestroySignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "destroy::#{@detail}" : "destroy"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "destroy")
      end
    end

    def destroy_signal
      DestroySignal.new(self)
    end

    # Emitted when the text direction of a widget changes.
    struct DirectionChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "direction-changed::#{@detail}" : "direction-changed"
      end

      def connect(&block : Proc(Gtk::TextDirection, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextDirection, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::TextDirection.new(lib_arg0)
          ::Box(Proc(Gtk::TextDirection, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::TextDirection.new(lib_arg0)
          ::Box(Proc(Gtk::TextDirection, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::TextDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextDirection.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::TextDirection, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::TextDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextDirection.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::TextDirection, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(previous_direction : Gtk::TextDirection) : Nil
        LibGObject.g_signal_emit_by_name(@source, "direction-changed", previous_direction)
      end
    end

    def direction_changed_signal
      DirectionChangedSignal.new(self)
    end

    # Emitted when @widget is hidden.
    struct HideSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "hide::#{@detail}" : "hide"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "hide")
      end
    end

    def hide_signal
      HideSignal.new(self)
    end

    # Emitted if keyboard navigation fails.
    #
    # See `Gtk::Widget#keynav_failed` for details.
    struct KeynavFailedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "keynav-failed::#{@detail}" : "keynav-failed"
      end

      def connect(&block : Proc(Gtk::DirectionType, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::DirectionType, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::DirectionType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.new(lib_arg0)
          _retval = ::Box(Proc(Gtk::DirectionType, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DirectionType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.new(lib_arg0)
          _retval = ::Box(Proc(Gtk::DirectionType, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::DirectionType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::DirectionType, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::DirectionType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::DirectionType, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(direction : Gtk::DirectionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "keynav-failed", direction)
      end
    end

    def keynav_failed_signal
      KeynavFailedSignal.new(self)
    end

    # Emitted when @widget is going to be mapped.
    #
    # A widget is mapped when the widget is visible (which is controlled with
    # `Gtk::Widget#visible`) and all its parents up to the toplevel widget
    # are also visible.
    #
    # The ::map signal can be used to determine whether a widget will be drawn,
    # for instance it can resume an animation that was stopped during the
    # emission of `Gtk::Widget::#unmap`.
    struct MapSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "map::#{@detail}" : "map"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "map")
      end
    end

    def map_signal
      MapSignal.new(self)
    end

    # Emitted when a widget is activated via a mnemonic.
    #
    # The default handler for this signal activates @widget if @group_cycling
    # is %FALSE, or just makes @widget grab focus if @group_cycling is %TRUE.
    struct MnemonicActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "mnemonic-activate::#{@detail}" : "mnemonic-activate"
      end

      def connect(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          _retval = ::Box(Proc(Bool, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          _retval = ::Box(Proc(Bool, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Widget, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Widget, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(group_cycling : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mnemonic-activate", group_cycling)
      end
    end

    def mnemonic_activate_signal
      MnemonicActivateSignal.new(self)
    end

    # Emitted when the focus is moved.
    struct MoveFocusSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-focus::#{@detail}" : "move-focus"
      end

      def connect(&block : Proc(Gtk::DirectionType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::DirectionType, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.new(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.new(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::DirectionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::DirectionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(direction : Gtk::DirectionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-focus", direction)
      end
    end

    def move_focus_signal
      MoveFocusSignal.new(self)
    end

    # Emitted when the widgets tooltip is about to be shown.
    #
    # This happens when the [property@Gtk.Widget:has-tooltip] property
    # is %TRUE and the hover timeout has expired with the cursor hovering
    # "above" @widget; or emitted when @widget got focus in keyboard mode.
    #
    # Using the given coordinates, the signal handler should determine
    # whether a tooltip should be shown for @widget. If this is the case
    # %TRUE should be returned, %FALSE otherwise.  Note that if
    # @keyboard_mode is %TRUE, the values of @x and @y are undefined and
    # should not be used.
    #
    # The signal handler is free to manipulate @tooltip with the therefore
    # destined function calls.
    struct QueryTooltipSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "query-tooltip::#{@detail}" : "query-tooltip"
      end

      def connect(&block : Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool))
        connect(block)
      end

      def connect(block : Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = Gtk::Tooltip.new(lib_arg3, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool)).unbox(box).call(arg0, arg1, arg2, arg3)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = Gtk::Tooltip.new(lib_arg3, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool)).unbox(box).call(arg0, arg1, arg2, arg3)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Int32, Int32, Bool, Gtk::Tooltip, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = Gtk::Tooltip.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Int32, Int32, Bool, Gtk::Tooltip, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Int32, Int32, Bool, Gtk::Tooltip, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, lib_arg2 : LibC::Int, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          arg3 = Gtk::Tooltip.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Int32, Int32, Bool, Gtk::Tooltip, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Int32, y : Int32, keyboard_mode : Bool, tooltip : Gtk::Tooltip) : Nil
        LibGObject.g_signal_emit_by_name(@source, "query-tooltip", x, y, keyboard_mode, tooltip)
      end
    end

    def query_tooltip_signal
      QueryTooltipSignal.new(self)
    end

    # Emitted when @widget is associated with a `GdkSurface`.
    #
    # This means that `Gtk::Widget#realize` has been called
    # or the widget has been mapped (that is, it is going to be drawn).
    struct RealizeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "realize::#{@detail}" : "realize"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "realize")
      end
    end

    def realize_signal
      RealizeSignal.new(self)
    end

    # Emitted when @widget is shown.
    struct ShowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "show::#{@detail}" : "show"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "show")
      end
    end

    def show_signal
      ShowSignal.new(self)
    end

    # Emitted when the widget state changes.
    #
    # See `Gtk::Widget#state_flags`.
    struct StateFlagsChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "state-flags-changed::#{@detail}" : "state-flags-changed"
      end

      def connect(&block : Proc(Gtk::StateFlags, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::StateFlags, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::StateFlags, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::StateFlags.new(lib_arg0)
          ::Box(Proc(Gtk::StateFlags, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::StateFlags, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::StateFlags.new(lib_arg0)
          ::Box(Proc(Gtk::StateFlags, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::StateFlags, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::StateFlags.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::StateFlags, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::StateFlags, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::StateFlags.new(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::StateFlags, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(flags : Gtk::StateFlags) : Nil
        LibGObject.g_signal_emit_by_name(@source, "state-flags-changed", flags)
      end
    end

    def state_flags_changed_signal
      StateFlagsChangedSignal.new(self)
    end

    # Emitted when @widget is going to be unmapped.
    #
    # A widget is unmapped when either it or any of its parents up to the
    # toplevel widget have been set as hidden.
    #
    # As ::unmap indicates that a widget will not be shown any longer,
    # it can be used to, for example, stop an animation on the widget.
    struct UnmapSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unmap::#{@detail}" : "unmap"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "unmap")
      end
    end

    def unmap_signal
      UnmapSignal.new(self)
    end

    # Emitted when the `GdkSurface` associated with @widget is destroyed.
    #
    # This means that `Gtk::Widget#unrealize` has been called
    # or the widget has been unmapped (that is, it is going to be hidden).
    struct UnrealizeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unrealize::#{@detail}" : "unrealize"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "unrealize")
      end
    end

    def unrealize_signal
      UnrealizeSignal.new(self)
    end
  end
end
