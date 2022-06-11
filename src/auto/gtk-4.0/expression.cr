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
  # `Gtk::Expression#evaluate` for evaluating an expression.
  #
  # Various methods for defining expressions exist, from simple constants via
  # `Gtk::ConstantExpression.new` to looking up properties in a `GObject`
  # (even recursively) via `Gtk::PropertyExpression.new` or providing
  # custom functions to transform and combine expressions via
  # `Gtk::ClosureExpression.new`.
  #
  # Here is an example of a complex expression:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # changes, an expression needs to be "watched" via a `Gtk#ExpressionWatch`,
  # which will cause a callback to be called whenever the value of the expression may
  # have changed; `Gtk::Expression#watch` starts watching an expression, and
  # `Gtk::ExpressionWatch#unwatch` stops.
  #
  # Watches can be created for automatically updating the property of an object,
  # similar to GObject's `GBinding` mechanism, by using `Gtk::Expression#bind`.
  #
  # ## GtkExpression in GObject properties
  #
  # In order to use a `GtkExpression` as a `GObject` property, you must use the
  # `#gtk_param_spec_expression` when creating a `GParamSpec` to install in the
  # `GObject` class being defined; for instance:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # virtual functions, you must use `#gtk_value_get_expression`, to retrieve the
  # stored `GtkExpression` from the `GValue` container, and `#gtk_value_set_expression`,
  # to store the `GtkExpression` into the `GValue`; for instance:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # property, or in a `<binding name="property">` tag to bind a property to an expression.
  #
  # To create a property expression, use the `<lookup>` element. It can have a `type`
  # attribute to specify the object type, and a `name` attribute to specify the property
  # to look up. The content of `<lookup>` can either be an element specfiying the expression
  # to use the object, or a string that specifies the name of the object to use.
  #
  # Example:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  #   <lookup name='search'>string_filter</lookup>
  # ```
  #
  # To create a constant expression, use the `<constant>` element. If the type attribute
  # is specified, the element content is interpreted as a value of that type. Otherwise,
  # it is assumed to be an object. For instance:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  #   <constant>string_filter</constant>
  #   <constant type='gchararray'>Hello, world</constant>
  # ```
  #
  # To create a closure expression, use the `<closure>` element. The `type` and `function`
  # attributes specify what function to use for the closure, the content of the element
  # contains the expressions for the parameters. For instance:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  #   <closure type='gchararray' function='combine_args_somehow'>
  #     <constant type='gchararray'>File size:</constant>
  #     <lookup type='GFile' name='size'>myfile</lookup>
  #   </closure>
  # ```
  @[GObject::GeneratedWrapper]
  class Expression
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Expression, g_param_spec_get_qdata, g_param_spec_set_qdata)

    # Initialize a new `Expression`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.gtk_expression_ref(self) if transfer.none?
    end

    # Called by the garbage collector. Decreases the reference count of object.
    # (i.e. its memory is freed).
    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p - ref count: %d\n", self.class.name.to_unsafe, self, ref_count)
      {% end %}
      LibGObject.g_param_spec_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).null)
      LibGObject.g_param_spec_set_qdata(self, GICrystal::GC_COLLECTED_QDATA_KEY, Pointer(Void).new(0x1))
      LibGObject.gtk_expression_unref(self)
    end

    # Returns a pointer to the C object.
    def to_unsafe
      @pointer
    end

    # Cast a `GObject::Object` to `Expression`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Expression")
    end

    # Cast a `GObject::Object` to `Expression`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
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

    # Bind `target`'s property named `property` to `self`.
    #
    # The value that `self` evaluates to is set via `g_object_set()` on
    # `target`. This is repeated whenever `self` changes to ensure that
    # the object's property stays synchronized with `self`.
    #
    # If `self`'s evaluation fails, `target`'s `property` is not updated.
    # You can ensure that this doesn't happen by using a fallback
    # expression.
    #
    # Note that this function takes ownership of `self`. If you want
    # to keep it around, you should `Gtk::Expression#ref` it beforehand.
    def bind(target : GObject::Object, property : ::String, this_ : GObject::Object?) : Gtk::ExpressionWatch
      # gtk_expression_bind: (Method)
      # @this_: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      this_ = if this_.nil?
                Pointer(Void).null
              else
                this_.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_expression_bind(@pointer, target, property, this_)

      # Return value handling

      Gtk::ExpressionWatch.new(_retval, GICrystal::Transfer::None)
    end

    # Evaluates the given expression and on success stores the result
    # in @value.
    #
    # The `GType` of `value` will be the type given by
    # `Gtk::Expression#value_type`.
    #
    # It is possible that expressions cannot be evaluated - for example
    # when the expression references objects that have been destroyed or
    # set to `NULL`. In that case `value` will remain empty and `FALSE`
    # will be returned.
    def evaluate(this_ : GObject::Object?, value : _) : Bool
      # gtk_expression_evaluate: (Method)
      # @this_: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      this_ = if this_.nil?
                Pointer(Void).null
              else
                this_.to_unsafe
              end
      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_expression_evaluate(@pointer, this_, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the `GType` that this expression evaluates to.
    #
    # This type is constant and will not change over the lifetime
    # of this expression.
    def value_type : UInt64
      # gtk_expression_get_value_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_expression_get_value_type(@pointer)

      # Return value handling

      _retval
    end

    # Checks if the expression is static.
    #
    # A static expression will never change its result when
    # `Gtk::Expression#evaluate` is called on it with the same arguments.
    #
    # That means a call to `Gtk::Expression#watch` is not necessary because
    # it will never trigger a notify.
    def is_static : Bool
      # gtk_expression_is_static: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_expression_is_static(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Acquires a reference on the given `GtkExpression`.
    def ref : Gtk::Expression
      # gtk_expression_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_expression_ref(@pointer)

      # Return value handling

      Gtk::Expression.new(_retval, GICrystal::Transfer::Full)
    end

    # Releases a reference on the given `GtkExpression`.
    #
    # If the reference was the last, the resources associated to the `self` are
    # freed.
    def unref : Nil
      # gtk_expression_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_expression_unref(@pointer)

      # Return value handling
    end

    # Watch the given `expression` for changes.
    #
    # The @notify function will be called whenever the evaluation of `self`
    # may have changed.
    #
    # GTK cannot guarantee that the evaluation did indeed change when the @notify
    # gets invoked, but it guarantees the opposite: When it did in fact change,
    # the @notify will be invoked.
    def watch(this_ : GObject::Object?, notify : Gtk::ExpressionNotify) : Gtk::ExpressionWatch
      # gtk_expression_watch: (Method)
      # @this_: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      this_ = if this_.nil?
                Pointer(Void).null
              else
                this_.to_unsafe
              end
      # Generator::CallbackArgPlan
      if notify
        _box = ::Box.box(notify)
        notify = ->(lib_user_data : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(lib_user_data).call
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        notify = user_data = user_destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGtk.gtk_expression_watch(@pointer, this_, notify, user_data, user_destroy)

      # Return value handling

      Gtk::ExpressionWatch.new(_retval, GICrystal::Transfer::None)
    end
  end
end
