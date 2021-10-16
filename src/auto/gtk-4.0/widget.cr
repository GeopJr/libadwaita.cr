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
  # - [vfunc@Gtk.Widget.get_request_mode]
  # - [vfunc@Gtk.Widget.measure]
  #
  # There are some important things to keep in mind when implementing
  # height-for-width and when using it in widget implementations.
  #
  # If you implement a direct `GtkWidget` subclass that supports
  # height-for-width or width-for-height geometry management for itself
  # or its child widgets, the [vfunc@Gtk.Widget.get_request_mode] virtual
  # function must be implemented as well and return the widget's preferred
  # request mode. The default implementation of this virtual function
  # returns %GTK_SIZE_REQUEST_CONSTANT_SIZE, which means that the widget will
  # only ever get -1 passed as the for_size value to its
  # [vfunc@Gtk.Widget.measure] implementation.
  #
  # The geometry management system will query a widget hierarchy in
  # only one orientation at a time. When widgets are initially queried
  # for their minimum sizes it is generally done in two initial passes
  # in the [enum@Gtk.SizeRequestMode] chosen by the toplevel.
  #
  # For example, when queried in the normal %GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH mode:
  #
  # First, the default minimum and natural width for each widget
  # in the interface will be computed using [id@gtk_widget_measure] with an
  # orientation of %GTK_ORIENTATION_HORIZONTAL and a for_size of -1.
  # Because the preferred widths for each widget depend on the preferred
  # widths of their children, this information propagates up the hierarchy,
  # and finally a minimum and natural width is determined for the entire
  # toplevel. Next, the toplevel will use the minimum width to query for the
  # minimum height contextual to that width using [id@gtk_widget_measure] with an
  # orientation of %GTK_ORIENTATION_VERTICAL and a for_size of the just computed
  # width. This will also be a highly recursive operation. The minimum height
  # for the minimum width is normally used to set the minimum size constraint
  # on the toplevel.
  #
  # After the toplevel window has initially requested its size in both
  # dimensions it can go on to allocate itself a reasonable size (or a size
  # previously specified with [method@Gtk.Window.set_default_size]). During the
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
  # For instance, a [class@Gtk.Label] that does height-for-width word wrapping
  # will not expect to have [vfunc@Gtk.Widget.measure] with an orientation of
  # %GTK_ORIENTATION_VERTICAL called because that call is specific to a
  # width-for-height request. In this case the label must return the height
  # required for its own minimum possible width. By following this rule any
  # widget that handles height-for-width or width-for-height requests will
  # always be allocated at least enough space to fit its own content.
  #
  # Here are some examples of how a %GTK_SIZE_REQUEST_HEIGHT_FOR_WIDTH widget
  # generally deals with width-for-height requests:
  #
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
  # It will not work to use the wrapper function [method@Gtk.Widget.measure]
  # inside your own [vfunc@Gtk.Widget.size_allocate] implementation.
  # These return a request adjusted by [class@Gtk.SizeGroup], the widget's
  # align and expand flags, as well as its CSS style.
  #
  # If a widget used the wrappers inside its virtual method implementations,
  # then the adjustments (such as widget margins) would be applied
  # twice. GTK therefore does not allow this and will warn if you try
  # to do it.
  #
  # Of course if you are getting the size request for another widget, such
  # as a child widget, you must use [id@gtk_widget_measure]; otherwise, you
  # would not properly consider widget margins, [class@Gtk.SizeGroup], and
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
  # [vfunc@Gtk.Widget.measure] virtual function. It allows you to report
  # both a minimum and natural size.
  #
  # If a widget ends up baseline aligned it will be allocated all the space in
  # the parent as if it was %GTK_ALIGN_FILL, but the selected baseline can be
  # found via [id@gtk_widget_get_allocated_baseline]. If the baseline has a
  # value other than -1 you need to align the widget such that the baseline
  # appears at the position.
  #
  # ### GtkWidget as GtkBuildable
  #
  # The `GtkWidget` implementation of the `GtkBuildable` interface
  # supports various custom elements to specify additional aspects of widgets
  # that are not directly expressed as properties.
  #
  # If the widget uses a [class@Gtk.LayoutManager], `GtkWidget` supports
  # a custom `<layout>` element, used to define layout properties:
  #
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
  # time using [method@Gtk.WidgetClass.set_template].
  #
  # The interface description semantics expected in composite template descriptions
  # is slightly different from regular [class@Gtk.Builder] XML.
  #
  # Unlike regular interface descriptions, [method@Gtk.WidgetClass.set_template] will
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
  # template, you need to call [method@Gtk.WidgetClass.set_template_from_resource]
  # from the class initialization of your `GtkWidget` type:
  #
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
  # You will also need to call [method@Gtk.Widget.init_template] from the
  # instance initialization function:
  #
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
  # [id@gtk_widget_get_template_child] function, but you will typically declare
  # a pointer in the instance private data structure of your type using the same
  # name as the widget in the template definition, and call
  # [method@Gtk.WidgetClass.bind_template_child_full] (or one of its wrapper macros
  # [func@Gtk.widget_class_bind_template_child] and [func@Gtk.widget_class_bind_template_child_private])
  # with that name, e.g.
  #
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
  # You can also use [method@Gtk.WidgetClass.bind_template_callback_full] (or
  # is wrapper macro [func@Gtk.widget_class_bind_template_callback]) to connect
  # a signal callback defined in the template with a function visible in the
  # scope of the class, e.g.
  #
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
  class Widget < GObject::InitiallyUnowned
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[35]
      _values = StaticArray(LibGObject::Value, 35).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if css_classes
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if css_name
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if has_default
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_tooltip
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if height_request
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if hexpand
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if hexpand_set
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if margin_bottom
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if margin_end
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if margin_start
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if margin_top
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if opacity
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if tooltip_markup
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if tooltip_text
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if vexpand
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if vexpand_set
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Widget.g_type, _n, _names, _values)
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
      Gtk::Align.from_value(value)
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
      Gtk::Overflow.from_value(value)
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
      Gtk::Align.from_value(value)
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

    def self.default_direction : Gtk::TextDirection
      # gtk_widget_get_default_direction: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_default_direction
      Gtk::TextDirection.from_value(_retval)
    end

    def self.default_direction=(dir : Gtk::TextDirection) : Nil
      # gtk_widget_set_default_direction: (None)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_default_direction(dir)
    end

    def action_set_enabled(action_name : ::String, enabled : Bool) : Nil
      # gtk_widget_action_set_enabled: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_action_set_enabled(self, action_name, enabled)
    end

    def activate : Bool
      # gtk_widget_activate: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_activate(self)
      GICrystal.to_bool(_retval)
    end

    def activate_action(name : ::String, args : _?) : Bool
      # gtk_widget_activate_action_variant: (Method)
      # @args: (nullable)
      # Returns: (transfer none)

      args = if args.nil?
               Pointer(Void).null
             else
               args.to_unsafe
             end
      args = GLib::Variant.new(args) unless args.is_a?(GLib::Variant)

      _retval = LibGtk.gtk_widget_activate_action_variant(self, name, args)
      GICrystal.to_bool(_retval)
    end

    def activate_default : Nil
      # gtk_widget_activate_default: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_activate_default(self)
    end

    def add_controller(controller : Gtk::EventController) : Nil
      # gtk_widget_add_controller: (Method)
      # @controller: (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(controller)

      LibGtk.gtk_widget_add_controller(self, controller)
    end

    def add_css_class(css_class : ::String) : Nil
      # gtk_widget_add_css_class: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_add_css_class(self, css_class)
    end

    def add_mnemonic_label(label : Gtk::Widget) : Nil
      # gtk_widget_add_mnemonic_label: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_add_mnemonic_label(self, label)
    end

    def add_tick_callback(callback : Pointer(Void), user_data : Pointer(Nil)?, notify : Pointer(Void)) : UInt32
      # gtk_widget_add_tick_callback: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      _retval = LibGtk.gtk_widget_add_tick_callback(self, callback, user_data, notify)
      _retval
    end

    def allocate(width : Int32, height : Int32, baseline : Int32, transform : Gsk::Transform?) : Nil
      # gtk_widget_allocate: (Method)
      # @transform: (transfer full) (nullable)
      # Returns: (transfer none)

      transform = if transform.nil?
                    Pointer(Void).null
                  else
                    transform.to_unsafe
                  end
      LibGObject.g_object_ref(transform)

      LibGtk.gtk_widget_allocate(self, width, height, baseline, transform)
    end

    def child_focus(direction : Gtk::DirectionType) : Bool
      # gtk_widget_child_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_child_focus(self, direction)
      GICrystal.to_bool(_retval)
    end

    def compute_bounds(target : Gtk::Widget) : Graphene::Rect
      # gtk_widget_compute_bounds: (Method)
      # @out_bounds: (out) (caller-allocates)
      # Returns: (transfer none)

      out_bounds = Graphene::Rect.new

      _retval = LibGtk.gtk_widget_compute_bounds(self, target, out_bounds)
      out_bounds
    end

    def compute_expand(orientation : Gtk::Orientation) : Bool
      # gtk_widget_compute_expand: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_compute_expand(self, orientation)
      GICrystal.to_bool(_retval)
    end

    def compute_point(target : Gtk::Widget, point : Graphene::Point) : Graphene::Point
      # gtk_widget_compute_point: (Method)
      # @out_point: (out) (caller-allocates)
      # Returns: (transfer none)

      out_point = Graphene::Point.new

      _retval = LibGtk.gtk_widget_compute_point(self, target, point, out_point)
      out_point
    end

    def compute_transform(target : Gtk::Widget) : Graphene::Matrix
      # gtk_widget_compute_transform: (Method)
      # @out_transform: (out) (caller-allocates)
      # Returns: (transfer none)

      out_transform = Graphene::Matrix.new

      _retval = LibGtk.gtk_widget_compute_transform(self, target, out_transform)
      out_transform
    end

    def contains(x : Float64, y : Float64) : Bool
      # gtk_widget_contains: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_contains(self, x, y)
      GICrystal.to_bool(_retval)
    end

    def create_pango_context : Pango::Context
      # gtk_widget_create_pango_context: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_widget_create_pango_context(self)
      Pango::Context.new(_retval, GICrystal::Transfer::Full)
    end

    def create_pango_layout(text : ::String?) : Pango::Layout
      # gtk_widget_create_pango_layout: (Method)
      # @text: (nullable)
      # Returns: (transfer full)

      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      _retval = LibGtk.gtk_widget_create_pango_layout(self, text)
      Pango::Layout.new(_retval, GICrystal::Transfer::Full)
    end

    def drag_check_threshold(start_x : Int32, start_y : Int32, current_x : Int32, current_y : Int32) : Bool
      # gtk_drag_check_threshold: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_drag_check_threshold(self, start_x, start_y, current_x, current_y)
      GICrystal.to_bool(_retval)
    end

    def error_bell : Nil
      # gtk_widget_error_bell: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_error_bell(self)
    end

    def allocated_baseline : Int32
      # gtk_widget_get_allocated_baseline: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_allocated_baseline(self)
      _retval
    end

    def allocated_height : Int32
      # gtk_widget_get_allocated_height: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_allocated_height(self)
      _retval
    end

    def allocated_width : Int32
      # gtk_widget_get_allocated_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_allocated_width(self)
      _retval
    end

    def allocation : Gdk::Rectangle
      # gtk_widget_get_allocation: (Method)
      # @allocation: (out) (caller-allocates)
      # Returns: (transfer none)

      allocation = Gdk::Rectangle.new

      LibGtk.gtk_widget_get_allocation(self, allocation)
      allocation
    end

    def ancestor(widget_type : UInt64) : Gtk::Widget?
      # gtk_widget_get_ancestor: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_ancestor(self, widget_type)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def can_focus : Bool
      # gtk_widget_get_can_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_can_focus(self)
      GICrystal.to_bool(_retval)
    end

    def can_target : Bool
      # gtk_widget_get_can_target: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_can_target(self)
      GICrystal.to_bool(_retval)
    end

    def child_visible : Bool
      # gtk_widget_get_child_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_child_visible(self)
      GICrystal.to_bool(_retval)
    end

    def clipboard : Gdk::Clipboard
      # gtk_widget_get_clipboard: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_clipboard(self)
      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    def css_classes : Enumerable(::String)
      # gtk_widget_get_css_classes: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_widget_get_css_classes(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def css_name : ::String
      # gtk_widget_get_css_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_css_name(self)
      ::String.new(_retval)
    end

    def cursor : Gdk::Cursor?
      # gtk_widget_get_cursor: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_cursor(self)
      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def direction : Gtk::TextDirection
      # gtk_widget_get_direction: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_direction(self)
      Gtk::TextDirection.from_value(_retval)
    end

    def display : Gdk::Display
      # gtk_widget_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def first_child : Gtk::Widget?
      # gtk_widget_get_first_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_first_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def focus_child : Gtk::Widget?
      # gtk_widget_get_focus_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_focus_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def focus_on_click : Bool
      # gtk_widget_get_focus_on_click: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_focus_on_click(self)
      GICrystal.to_bool(_retval)
    end

    def focusable : Bool
      # gtk_widget_get_focusable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_focusable(self)
      GICrystal.to_bool(_retval)
    end

    def font_map : Pango::FontMap?
      # gtk_widget_get_font_map: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_font_map(self)
      Pango::FontMap.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def font_options : Cairo::FontOptions?
      # gtk_widget_get_font_options: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_font_options(self)
      Cairo::FontOptions.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def frame_clock : Gdk::FrameClock?
      # gtk_widget_get_frame_clock: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_frame_clock(self)
      Gdk::FrameClock.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def halign : Gtk::Align
      # gtk_widget_get_halign: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_halign(self)
      Gtk::Align.from_value(_retval)
    end

    def has_tooltip : Bool
      # gtk_widget_get_has_tooltip: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_has_tooltip(self)
      GICrystal.to_bool(_retval)
    end

    def height : Int32
      # gtk_widget_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_height(self)
      _retval
    end

    def hexpand : Bool
      # gtk_widget_get_hexpand: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_hexpand(self)
      GICrystal.to_bool(_retval)
    end

    def hexpand_set : Bool
      # gtk_widget_get_hexpand_set: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_hexpand_set(self)
      GICrystal.to_bool(_retval)
    end

    def last_child : Gtk::Widget?
      # gtk_widget_get_last_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_last_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def layout_manager : Gtk::LayoutManager?
      # gtk_widget_get_layout_manager: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_layout_manager(self)
      Gtk::LayoutManager.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def mapped : Bool
      # gtk_widget_get_mapped: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_mapped(self)
      GICrystal.to_bool(_retval)
    end

    def margin_bottom : Int32
      # gtk_widget_get_margin_bottom: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_margin_bottom(self)
      _retval
    end

    def margin_end : Int32
      # gtk_widget_get_margin_end: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_margin_end(self)
      _retval
    end

    def margin_start : Int32
      # gtk_widget_get_margin_start: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_margin_start(self)
      _retval
    end

    def margin_top : Int32
      # gtk_widget_get_margin_top: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_margin_top(self)
      _retval
    end

    def name : ::String
      # gtk_widget_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_name(self)
      ::String.new(_retval)
    end

    def native : Gtk::Native?
      # gtk_widget_get_native: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_native(self)
      Gtk::Native__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def next_sibling : Gtk::Widget?
      # gtk_widget_get_next_sibling: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_next_sibling(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def opacity : Float64
      # gtk_widget_get_opacity: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_opacity(self)
      _retval
    end

    def overflow : Gtk::Overflow
      # gtk_widget_get_overflow: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_overflow(self)
      Gtk::Overflow.from_value(_retval)
    end

    def pango_context : Pango::Context
      # gtk_widget_get_pango_context: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_pango_context(self)
      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    def parent : Gtk::Widget?
      # gtk_widget_get_parent: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_parent(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def preferred_size : Gtk::Requisition
      # gtk_widget_get_preferred_size: (Method)
      # @minimum_size: (out) (caller-allocates) (optional)
      # @natural_size: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      minimum_size = Pointer(Void).null
      natural_size = Pointer(Void).null
      minimum_size = Gtk::Requisition.new

      LibGtk.gtk_widget_get_preferred_size(self, minimum_size, natural_size)
      minimum_size
    end

    def prev_sibling : Gtk::Widget?
      # gtk_widget_get_prev_sibling: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_prev_sibling(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def primary_clipboard : Gdk::Clipboard
      # gtk_widget_get_primary_clipboard: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_primary_clipboard(self)
      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    def realized : Bool
      # gtk_widget_get_realized: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_realized(self)
      GICrystal.to_bool(_retval)
    end

    def receives_default : Bool
      # gtk_widget_get_receives_default: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_receives_default(self)
      GICrystal.to_bool(_retval)
    end

    def request_mode : Gtk::SizeRequestMode
      # gtk_widget_get_request_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_request_mode(self)
      Gtk::SizeRequestMode.from_value(_retval)
    end

    def root : Gtk::Root?
      # gtk_widget_get_root: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_root(self)
      Gtk::Root__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def scale_factor : Int32
      # gtk_widget_get_scale_factor: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_scale_factor(self)
      _retval
    end

    def sensitive : Bool
      # gtk_widget_get_sensitive: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_sensitive(self)
      GICrystal.to_bool(_retval)
    end

    def settings : Gtk::Settings
      # gtk_widget_get_settings: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_settings(self)
      Gtk::Settings.new(_retval, GICrystal::Transfer::None)
    end

    def size(orientation : Gtk::Orientation) : Int32
      # gtk_widget_get_size: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_size(self, orientation)
      _retval
    end

    def size_request : Nil
      # gtk_widget_get_size_request: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      width = Pointer(Int32).null
      height = Pointer(Int32).null

      LibGtk.gtk_widget_get_size_request(self, width, height)
    end

    def state_flags : Gtk::StateFlags
      # gtk_widget_get_state_flags: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_state_flags(self)
      Gtk::StateFlags.from_value(_retval)
    end

    def style_context : Gtk::StyleContext
      # gtk_widget_get_style_context: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_style_context(self)
      Gtk::StyleContext.new(_retval, GICrystal::Transfer::None)
    end

    def template_child(widget_type : UInt64, name : ::String) : GObject::Object
      # gtk_widget_get_template_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_template_child(self, widget_type, name)
      GObject::Object.new(_retval, GICrystal::Transfer::None)
    end

    def tooltip_markup : ::String?
      # gtk_widget_get_tooltip_markup: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_tooltip_markup(self)
      ::String.new(_retval) unless _retval.null?
    end

    def tooltip_text : ::String?
      # gtk_widget_get_tooltip_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_tooltip_text(self)
      ::String.new(_retval) unless _retval.null?
    end

    def valign : Gtk::Align
      # gtk_widget_get_valign: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_valign(self)
      Gtk::Align.from_value(_retval)
    end

    def vexpand : Bool
      # gtk_widget_get_vexpand: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_vexpand(self)
      GICrystal.to_bool(_retval)
    end

    def vexpand_set : Bool
      # gtk_widget_get_vexpand_set: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_vexpand_set(self)
      GICrystal.to_bool(_retval)
    end

    def visible : Bool
      # gtk_widget_get_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_visible(self)
      GICrystal.to_bool(_retval)
    end

    def width : Int32
      # gtk_widget_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_get_width(self)
      _retval
    end

    def grab_focus : Bool
      # gtk_widget_grab_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_grab_focus(self)
      GICrystal.to_bool(_retval)
    end

    def has_css_class(css_class : ::String) : Bool
      # gtk_widget_has_css_class: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_has_css_class(self, css_class)
      GICrystal.to_bool(_retval)
    end

    def has_default : Bool
      # gtk_widget_has_default: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_has_default(self)
      GICrystal.to_bool(_retval)
    end

    def has_focus : Bool
      # gtk_widget_has_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_has_focus(self)
      GICrystal.to_bool(_retval)
    end

    def has_visible_focus : Bool
      # gtk_widget_has_visible_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_has_visible_focus(self)
      GICrystal.to_bool(_retval)
    end

    def hide : Nil
      # gtk_widget_hide: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_hide(self)
    end

    def in_destruction : Bool
      # gtk_widget_in_destruction: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_in_destruction(self)
      GICrystal.to_bool(_retval)
    end

    def init_template : Nil
      # gtk_widget_init_template: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_init_template(self)
    end

    def insert_action_group(name : ::String, group : Gio::ActionGroup?) : Nil
      # gtk_widget_insert_action_group: (Method)
      # @group: (nullable)
      # Returns: (transfer none)

      group = if group.nil?
                Pointer(Void).null
              else
                group.to_unsafe
              end

      LibGtk.gtk_widget_insert_action_group(self, name, group)
    end

    def insert_after(parent : Gtk::Widget, previous_sibling : Gtk::Widget?) : Nil
      # gtk_widget_insert_after: (Method)
      # @previous_sibling: (nullable)
      # Returns: (transfer none)

      previous_sibling = if previous_sibling.nil?
                           Pointer(Void).null
                         else
                           previous_sibling.to_unsafe
                         end

      LibGtk.gtk_widget_insert_after(self, parent, previous_sibling)
    end

    def insert_before(parent : Gtk::Widget, next_sibling : Gtk::Widget?) : Nil
      # gtk_widget_insert_before: (Method)
      # @next_sibling: (nullable)
      # Returns: (transfer none)

      next_sibling = if next_sibling.nil?
                       Pointer(Void).null
                     else
                       next_sibling.to_unsafe
                     end

      LibGtk.gtk_widget_insert_before(self, parent, next_sibling)
    end

    def is_ancestor(ancestor : Gtk::Widget) : Bool
      # gtk_widget_is_ancestor: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_is_ancestor(self, ancestor)
      GICrystal.to_bool(_retval)
    end

    def is_drawable : Bool
      # gtk_widget_is_drawable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_is_drawable(self)
      GICrystal.to_bool(_retval)
    end

    def is_focus : Bool
      # gtk_widget_is_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_is_focus(self)
      GICrystal.to_bool(_retval)
    end

    def is_sensitive : Bool
      # gtk_widget_is_sensitive: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_is_sensitive(self)
      GICrystal.to_bool(_retval)
    end

    def is_visible : Bool
      # gtk_widget_is_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_is_visible(self)
      GICrystal.to_bool(_retval)
    end

    def keynav_failed(direction : Gtk::DirectionType) : Bool
      # gtk_widget_keynav_failed: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_keynav_failed(self, direction)
      GICrystal.to_bool(_retval)
    end

    def list_mnemonic_labels : GLib::List
      # gtk_widget_list_mnemonic_labels: (Method)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_widget_list_mnemonic_labels(self)
      GLib::List(Gtk::Widget).new(_retval, GICrystal::Transfer::Container)
    end

    def map : Nil
      # gtk_widget_map: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_map(self)
    end

    def measure(orientation : Gtk::Orientation, for_size : Int32) : Nil
      # gtk_widget_measure: (Method)
      # @minimum: (out) (transfer full) (optional)
      # @natural: (out) (transfer full) (optional)
      # @minimum_baseline: (out) (transfer full) (optional)
      # @natural_baseline: (out) (transfer full) (optional)
      # Returns: (transfer none)

      minimum = Pointer(Int32).null
      natural = Pointer(Int32).null
      minimum_baseline = Pointer(Int32).null
      natural_baseline = Pointer(Int32).null

      LibGtk.gtk_widget_measure(self, orientation, for_size, minimum, natural, minimum_baseline, natural_baseline)
    end

    def mnemonic_activate(group_cycling : Bool) : Bool
      # gtk_widget_mnemonic_activate: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_mnemonic_activate(self, group_cycling)
      GICrystal.to_bool(_retval)
    end

    def observe_children : Gio::ListModel
      # gtk_widget_observe_children: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_widget_observe_children(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def observe_controllers : Gio::ListModel
      # gtk_widget_observe_controllers: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_widget_observe_controllers(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def pick(x : Float64, y : Float64, flags : Gtk::PickFlags) : Gtk::Widget?
      # gtk_widget_pick: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_pick(self, x, y, flags)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def queue_allocate : Nil
      # gtk_widget_queue_allocate: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_queue_allocate(self)
    end

    def queue_draw : Nil
      # gtk_widget_queue_draw: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_queue_draw(self)
    end

    def queue_resize : Nil
      # gtk_widget_queue_resize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_queue_resize(self)
    end

    def realize : Nil
      # gtk_widget_realize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_realize(self)
    end

    def remove_controller(controller : Gtk::EventController) : Nil
      # gtk_widget_remove_controller: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_remove_controller(self, controller)
    end

    def remove_css_class(css_class : ::String) : Nil
      # gtk_widget_remove_css_class: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_remove_css_class(self, css_class)
    end

    def remove_mnemonic_label(label : Gtk::Widget) : Nil
      # gtk_widget_remove_mnemonic_label: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_remove_mnemonic_label(self, label)
    end

    def remove_tick_callback(id : UInt32) : Nil
      # gtk_widget_remove_tick_callback: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_remove_tick_callback(self, id)
    end

    def can_focus=(can_focus : Bool) : Nil
      # gtk_widget_set_can_focus: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_can_focus(self, can_focus)
    end

    def can_target=(can_target : Bool) : Nil
      # gtk_widget_set_can_target: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_can_target(self, can_target)
    end

    def child_visible=(child_visible : Bool) : Nil
      # gtk_widget_set_child_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_child_visible(self, child_visible)
    end

    def css_classes=(classes : Enumerable(::String)) : Nil
      # gtk_widget_set_css_classes: (Method)
      # @classes: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      classes = classes.to_a.map(&.to_unsafe).to_unsafe

      LibGtk.gtk_widget_set_css_classes(self, classes)
    end

    def cursor=(cursor : Gdk::Cursor?) : Nil
      # gtk_widget_set_cursor: (Method)
      # @cursor: (nullable)
      # Returns: (transfer none)

      cursor = if cursor.nil?
                 Pointer(Void).null
               else
                 cursor.to_unsafe
               end

      LibGtk.gtk_widget_set_cursor(self, cursor)
    end

    def cursor_from_name=(name : ::String?) : Nil
      # gtk_widget_set_cursor_from_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      LibGtk.gtk_widget_set_cursor_from_name(self, name)
    end

    def direction=(dir : Gtk::TextDirection) : Nil
      # gtk_widget_set_direction: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_direction(self, dir)
    end

    def focus_child=(child : Gtk::Widget?) : Nil
      # gtk_widget_set_focus_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      LibGtk.gtk_widget_set_focus_child(self, child)
    end

    def focus_on_click=(focus_on_click : Bool) : Nil
      # gtk_widget_set_focus_on_click: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_focus_on_click(self, focus_on_click)
    end

    def focusable=(focusable : Bool) : Nil
      # gtk_widget_set_focusable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_focusable(self, focusable)
    end

    def font_map=(font_map : Pango::FontMap?) : Nil
      # gtk_widget_set_font_map: (Method)
      # @font_map: (nullable)
      # Returns: (transfer none)

      font_map = if font_map.nil?
                   Pointer(Void).null
                 else
                   font_map.to_unsafe
                 end

      LibGtk.gtk_widget_set_font_map(self, font_map)
    end

    def font_options=(options : Cairo::FontOptions?) : Nil
      # gtk_widget_set_font_options: (Method)
      # @options: (nullable)
      # Returns: (transfer none)

      options = if options.nil?
                  Pointer(Void).null
                else
                  options.to_unsafe
                end

      LibGtk.gtk_widget_set_font_options(self, options)
    end

    def halign=(align : Gtk::Align) : Nil
      # gtk_widget_set_halign: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_halign(self, align)
    end

    def has_tooltip=(has_tooltip : Bool) : Nil
      # gtk_widget_set_has_tooltip: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_has_tooltip(self, has_tooltip)
    end

    def hexpand=(expand : Bool) : Nil
      # gtk_widget_set_hexpand: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_hexpand(self, expand)
    end

    def hexpand_set=(set : Bool) : Nil
      # gtk_widget_set_hexpand_set: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_hexpand_set(self, set)
    end

    def layout_manager=(layout_manager : Gtk::LayoutManager?) : Nil
      # gtk_widget_set_layout_manager: (Method)
      # @layout_manager: (transfer full) (nullable)
      # Returns: (transfer none)

      layout_manager = if layout_manager.nil?
                         Pointer(Void).null
                       else
                         layout_manager.to_unsafe
                       end
      LibGObject.g_object_ref(layout_manager)

      LibGtk.gtk_widget_set_layout_manager(self, layout_manager)
    end

    def margin_bottom=(margin : Int32) : Nil
      # gtk_widget_set_margin_bottom: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_margin_bottom(self, margin)
    end

    def margin_end=(margin : Int32) : Nil
      # gtk_widget_set_margin_end: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_margin_end(self, margin)
    end

    def margin_start=(margin : Int32) : Nil
      # gtk_widget_set_margin_start: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_margin_start(self, margin)
    end

    def margin_top=(margin : Int32) : Nil
      # gtk_widget_set_margin_top: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_margin_top(self, margin)
    end

    def name=(name : ::String) : Nil
      # gtk_widget_set_name: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_name(self, name)
    end

    def opacity=(opacity : Float64) : Nil
      # gtk_widget_set_opacity: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_opacity(self, opacity)
    end

    def overflow=(overflow : Gtk::Overflow) : Nil
      # gtk_widget_set_overflow: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_overflow(self, overflow)
    end

    def parent=(parent : Gtk::Widget) : Nil
      # gtk_widget_set_parent: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_parent(self, parent)
    end

    def receives_default=(receives_default : Bool) : Nil
      # gtk_widget_set_receives_default: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_receives_default(self, receives_default)
    end

    def sensitive=(sensitive : Bool) : Nil
      # gtk_widget_set_sensitive: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_sensitive(self, sensitive)
    end

    def set_size_request(width : Int32, height : Int32) : Nil
      # gtk_widget_set_size_request: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_size_request(self, width, height)
    end

    def set_state_flags(flags : Gtk::StateFlags, clear : Bool) : Nil
      # gtk_widget_set_state_flags: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_state_flags(self, flags, clear)
    end

    def tooltip_markup=(markup : ::String?) : Nil
      # gtk_widget_set_tooltip_markup: (Method)
      # @markup: (nullable)
      # Returns: (transfer none)

      markup = if markup.nil?
                 Pointer(LibC::Char).null
               else
                 markup.to_unsafe
               end

      LibGtk.gtk_widget_set_tooltip_markup(self, markup)
    end

    def tooltip_text=(text : ::String?) : Nil
      # gtk_widget_set_tooltip_text: (Method)
      # @text: (nullable)
      # Returns: (transfer none)

      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      LibGtk.gtk_widget_set_tooltip_text(self, text)
    end

    def valign=(align : Gtk::Align) : Nil
      # gtk_widget_set_valign: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_valign(self, align)
    end

    def vexpand=(expand : Bool) : Nil
      # gtk_widget_set_vexpand: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_vexpand(self, expand)
    end

    def vexpand_set=(set : Bool) : Nil
      # gtk_widget_set_vexpand_set: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_vexpand_set(self, set)
    end

    def visible=(visible : Bool) : Nil
      # gtk_widget_set_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_set_visible(self, visible)
    end

    def should_layout : Bool
      # gtk_widget_should_layout: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_widget_should_layout(self)
      GICrystal.to_bool(_retval)
    end

    def show : Nil
      # gtk_widget_show: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_show(self)
    end

    def size_allocate(allocation : Gdk::Rectangle, baseline : Int32) : Nil
      # gtk_widget_size_allocate: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_size_allocate(self, allocation, baseline)
    end

    def snapshot_child(child : Gtk::Widget, snapshot : Gtk::Snapshot) : Nil
      # gtk_widget_snapshot_child: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_snapshot_child(self, child, snapshot)
    end

    def translate_coordinates(dest_widget : Gtk::Widget, src_x : Float64, src_y : Float64) : Bool
      # gtk_widget_translate_coordinates: (Method)
      # @dest_x: (out) (transfer full) (optional)
      # @dest_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      dest_x = Pointer(Float64).null
      dest_y = Pointer(Float64).null

      _retval = LibGtk.gtk_widget_translate_coordinates(self, dest_widget, src_x, src_y, dest_x, dest_y)
      GICrystal.to_bool(_retval)
    end

    def trigger_tooltip_query : Nil
      # gtk_widget_trigger_tooltip_query: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_trigger_tooltip_query(self)
    end

    def unmap : Nil
      # gtk_widget_unmap: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_unmap(self)
    end

    def unparent : Nil
      # gtk_widget_unparent: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_unparent(self)
    end

    def unrealize : Nil
      # gtk_widget_unrealize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_unrealize(self)
    end

    def unset_state_flags(flags : Gtk::StateFlags) : Nil
      # gtk_widget_unset_state_flags: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_widget_unset_state_flags(self, flags)
    end

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
          arg0 = Gtk::TextDirection.from_value(lib_arg0)
          ::Box(Proc(Gtk::TextDirection, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::TextDirection.from_value(lib_arg0)
          ::Box(Proc(Gtk::TextDirection, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::TextDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextDirection.from_value(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::TextDirection, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::TextDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextDirection.from_value(lib_arg0)
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
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DirectionType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::DirectionType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::DirectionType, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::DirectionType, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
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
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
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
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::DirectionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
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
          ::Box(Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool)).unbox(box).call(arg0, arg1, arg2, arg3).to_unsafe
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
          ::Box(Proc(Int32, Int32, Bool, Gtk::Tooltip, Bool)).unbox(box).call(arg0, arg1, arg2, arg3).to_unsafe
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
          arg0 = Gtk::StateFlags.from_value(lib_arg0)
          ::Box(Proc(Gtk::StateFlags, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::StateFlags, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::StateFlags.from_value(lib_arg0)
          ::Box(Proc(Gtk::StateFlags, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::StateFlags, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::StateFlags.from_value(lib_arg0)
          ::Box(Proc(Gtk::Widget, Gtk::StateFlags, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::StateFlags, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Widget.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::StateFlags.from_value(lib_arg0)
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
