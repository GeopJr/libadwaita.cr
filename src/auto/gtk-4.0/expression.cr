module Gtk
  # `GtkExpression` provides a way to describe references to values.
  #
  # An important aspect of expressions is that the value can be obtained
  # from a source that is several steps away. For example, an expression
  # may describe ‘the value of property A of `object1`, which is itself the
  # value of a property of `object2`’. And `object1` may not even exist yet
  # at the time that the expression is created. This is contrast to `GObject`
  # property bindings, which can only create direct connections between
  # the properties of two objects that must both exist for the duration
  # of the binding.
  #
  # An expression needs to be "evaluated" to obtain the value that it currently
  # refers to. An evaluation always happens in the context of a current object
  # called `this` (it mirrors the behavior of object-oriented languages),
  # which may or may not influence the result of the evaluation. Use
  # [method@Gtk.Expression.evaluate] for evaluating an expression.
  #
  # Various methods for defining expressions exist, from simple constants via
  # [ctor@Gtk.ConstantExpression.new] to looking up properties in a `GObject`
  # (even recursively) via [ctor@Gtk.PropertyExpression.new] or providing
  # custom functions to transform and combine expressions via
  # [ctor@Gtk.ClosureExpression.new].
  #
  # Here is an example of a complex expression:
  #
  # ```c
  #   color_expr = gtk_property_expression_new (GTK_TYPE_LIST_ITEM,
  #                                             NULL, "item");
  #   expression = gtk_property_expression_new (GTK_TYPE_COLOR,
  #                                             color_expr, "name");
  # ```
  #
  # when evaluated with `this` being a `GtkListItem`, it will obtain the
  # "item" property from the `GtkListItem`, and then obtain the "name" property
  # from the resulting object (which is assumed to be of type `GTK_TYPE_COLOR`).
  #
  # A more concise way to describe this would be
  #
  # ```
  #   this->item->name
  # ```
  #
  # The most likely place where you will encounter expressions is in the context
  # of list models and list widgets using them. For example, `GtkDropDown` is
  # evaluating a `GtkExpression` to obtain strings from the items in its model
  # that it can then use to match against the contents of its search entry.
  # `GtkStringFilter` is using a `GtkExpression` for similar reasons.
  #
  # By default, expressions are not paying attention to changes and evaluation is
  # just a snapshot of the current state at a given time. To get informed about
  # changes, an expression needs to be "watched" via a [struct@Gtk.ExpressionWatch],
  # which will cause a callback to be called whenever the value of the expression may
  # have changed; [method@Gtk.Expression.watch] starts watching an expression, and
  # [method@Gtk.ExpressionWatch.unwatch] stops.
  #
  # Watches can be created for automatically updating the property of an object,
  # similar to GObject's `GBinding` mechanism, by using [method@Gtk.Expression.bind].
  #
  # ## GtkExpression in GObject properties
  #
  # In order to use a `GtkExpression` as a `GObject` property, you must use the
  # [id@gtk_param_spec_expression] when creating a `GParamSpec` to install in the
  # `GObject` class being defined; for instance:
  #
  # ```c
  # obj_props[PROP_EXPRESSION] =
  #   gtk_param_spec_expression ("expression",
  #                              "Expression",
  #                              "The expression used by the widget",
  #                              G_PARAM_READWRITE |
  #                              G_PARAM_STATIC_STRINGS |
  #                              G_PARAM_EXPLICIT_NOTIFY);
  # ```
  #
  # When implementing the `GObjectClass.set_property` and `GObjectClass.get_property`
  # virtual functions, you must use [id@gtk_value_get_expression], to retrieve the
  # stored `GtkExpression` from the `GValue` container, and [id@gtk_value_set_expression],
  # to store the `GtkExpression` into the `GValue`; for instance:
  #
  # ```c
  #   // in set_property()...
  #   case PROP_EXPRESSION:
  #     foo_widget_set_expression (foo, gtk_value_get_expression (value));
  #     break;
  #
  #   // in get_property()...
  #   case PROP_EXPRESSION:
  #     gtk_value_set_expression (value, foo->expression);
  #     break;
  # ```
  #
  # ## GtkExpression in .ui files
  #
  # `GtkBuilder` has support for creating expressions. The syntax here can be used where
  # a `GtkExpression` object is needed like in a `<property>` tag for an expression
  # property, or in a `<binding>` tag to bind a property to an expression.
  #
  # To create an property expression, use the `<lookup>` element. It can have a `type`
  # attribute to specify the object type, and a `name` attribute to specify the property
  # to look up. The content of `<lookup>` can either be an element specfiying the expression
  # to use the object, or a string that specifies the name of the object to use.
  #
  # Example:
  #
  # ```xml
  #   <lookup name='search'>string_filter</lookup>
  # ```
  #
  # To create a constant expression, use the `<constant>` element. If the type attribute
  # is specified, the element content is interpreted as a value of that type. Otherwise,
  # it is assumed to be an object. For instance:
  #
  # ```xml
  #   <constant>string_filter</constant>
  #   <constant type='gchararray'>Hello, world</constant>
  # ```
  #
  # To create a closure expression, use the `<closure>` element. The `type` and `function`
  # attributes specify what function to use for the closure, the content of the element
  # contains the expressions for the parameters. For instance:
  #
  # ```xml
  #   <closure type='gchararray' function='combine_args_somehow'>
  #     <constant type='gchararray'>File size:</constant>
  #     <lookup type='GFile' name='size'>myfile</lookup>
  #   </closure>
  # ```
  class Expression
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Cast a `GObject::Object` to `Expression`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Expression")
    end

    # Cast a `GObject::Object` to `Expression`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_expression_get_type
    end

    def bind(target : GObject::Object, property : ::String, this_ : GObject::Object?) : Gtk::ExpressionWatch
      # gtk_expression_bind: (Method)
      # @this_: (nullable)
      # Returns: (transfer none)

      this_ = if this_.nil?
                Pointer(Void).null
              else
                this_.to_unsafe
              end

      _retval = LibGtk.gtk_expression_bind(self, target, property, this_)
      Gtk::ExpressionWatch.new(_retval, GICrystal::Transfer::None)
    end

    def evaluate(this_ : GObject::Object?, value : _) : Bool
      # gtk_expression_evaluate: (Method)
      # @this_: (nullable)
      # Returns: (transfer none)

      this_ = if this_.nil?
                Pointer(Void).null
              else
                this_.to_unsafe
              end
      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGtk.gtk_expression_evaluate(self, this_, value)
      GICrystal.to_bool(_retval)
    end

    def value_type : UInt64
      # gtk_expression_get_value_type: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_expression_get_value_type(self)
      _retval
    end

    def is_static : Bool
      # gtk_expression_is_static: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_expression_is_static(self)
      GICrystal.to_bool(_retval)
    end

    def ref : Gtk::Expression
      # gtk_expression_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_expression_ref(self)
      Gtk::Expression.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gtk_expression_unref: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_expression_unref(self)
    end

    def watch(this_ : GObject::Object?, notify : Pointer(Void), user_data : Pointer(Nil)?, user_destroy : Pointer(Void)) : Gtk::ExpressionWatch
      # gtk_expression_watch: (Method)
      # @this_: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      this_ = if this_.nil?
                Pointer(Void).null
              else
                this_.to_unsafe
              end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      _retval = LibGtk.gtk_expression_watch(self, this_, notify, user_data, user_destroy)
      Gtk::ExpressionWatch.new(_retval, GICrystal::Transfer::None)
    end
  end
end
