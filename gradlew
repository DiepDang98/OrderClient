x�X]��4�yŪ�n��}�^��@<�}p��6U� 4��s3���+��; ��h�7�=���=]���[���7o�3[7����۟�'�y��̚C�;t��댨��w1����>��Sڮb����]7�DϏ_s5��m;更�r{�3�v1.�����"n��:u��ۢ͛���:�MnW�C^V?�}sh��;�EYc�>��|�����z�^��(6iw�ǆ�`�{gOs]�X��\��T|�|�6m�U�n�sc��X��,���re���Pqc�Q��E��X�����^@��$Z��i^�AQ�}���z�i�g��>��oևͶ֓��W�>w}�1c�y[�OF̎�9���5~�u�-���Tz���FI�a�`�H�\�+��qu���z���$UH���䠲�9�42{/�� {l����R���g�if�e�y��L&$�	̈́a�2��L&9��IɤbR3i��L:&=���z&L�7~Ǆ�O1�"�!y���̠m�)�<`zX����
��������h��Sx�@,rZ� $1�0���F��<���<T9��1:�"�n�!��<�΂`A���/��>FЂ��@o"cz��m���х�4�Lb(�4��-�:,1t����8Q%,h��(�>MT���§��)�/�$$%1�H:�4c)ؤhywm���T�����	�_�:��c���_�u����U�r���tSa�s��K�Mɗ�L��1�����s9߭��s��5���2��*u.܂_/��Y�M��sv������uUK>���)��l�F�>;��@�ީ�O��})}V�Q��x����[�Jl�T�"�"�R��2!9Y�ĸM�*uu��j2:��_v��Kmrk��k2|�	�n�v���5T�{A��������׎i?�lK�ȑ�8ϝ��4ax�p�^#��"�Ų,r�9��^)#�
�^�����y_��un�g���v�����e1�Y/���'& fVQq�|ak��v���Ħ�/È��Y#�/YƦ>پ�����#!�	��
}�T���-$��P���<L	�L��T�
���eY/��q2�ycBx� ���t����d<	�U�d5�W���q�(A�2l���E�Zz���4YLr�2ӣG���f���zzC���TV�*��S&Ly��%G�ds��H�9�p�F��8�s$A5z������WdI{��w��a��Cf��t���Ғ����z|q #@��F,�I��r��[�p⚬�6-g�4�i� Tc1���������������S�����8ӏ                                                                                                                                                                                           a"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n $MAX_FD
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
    JAVACMD=`cygpath --unix "$JAVACMD"`

    # We build the pattern for arguments to be converted via cygpath
    ROOTDIRSRAW=`find -L / -maxdepth 1 -mindepth 1 -type d 2>/dev/null`
    SEP=""
    for dir in $ROOTDIRSRAW ; do
        ROOTDIRS="$ROOTDIRS$SEP$dir"
        SEP="|"
    done
    OURCYGPATTERN="(^($ROOTDIRS))"
    # Add a user-defined pattern to the cygpath arguments
    if [ "$GRADLE_CYGPATTERN" != "" ] ; then
        OURCYGPATTERN="$OURCYGPATTERN|($GRADLE_CYGPATTERN)"
    fi
    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    i=0
    for arg in "$@" ; do
        CHECK=`echo "$arg"|egrep -c "$OURCYGPATTERN" -`
        CHECK2=`echo "$arg"|egrep -c "^-"`                                 ### Determine if an option

        if [ $CHECK -ne 0 ] && [ $CHECK2 -eq 0 ] ; then                    ### Added a condition
            eval `echo args$i`=`cygpath --path --ignore --mixed "$arg"`
        else
            eval `echo args$i`="\"$arg\""
        fi
        i=$((i+1))
    done
    case $i in
        (0) set -- ;;
        (1) set -- "$args0" ;;
        (2) set -- "$args0" "$args1" ;;
        (3) set -- "$args0" "$args1" "$args2" ;;
        (4) set -- "$args0" "$args1" "$args2" "$args3" ;;
        (5) set -- "$args0" "$args1" "$args2" "$args3" "$args4" ;;
        (6) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" ;;
        (7) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" ;;
        (8) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" ;;
        (9) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" "$args8" ;;
    esac
fi

# Escape application args
save () {
    for i do printf %s\\n "$i" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/" ; done
    echo " "
}
APP_ARGS=$(save "$@")

# Collect all arguments for the java command, following the shell quoting and substitution rules
eval set -- $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS "\"-Dorg.gradle.appname=$APP_BASE_NAME\"" -classpath "\"$CLASSPATH\"" org.gradle.wrapper.GradleWrapperMain "$APP_ARGS"

# by default we should be in the correct project dir, but when run from Finder on Mac, the cwd is wrong
if [ "$(uname)" = "Darwin" ] && [ "$HOME" = "$PWD" ]; then
  cd "$(dirname "$0")"
fi

exec "$JAVACMD" "$@"
