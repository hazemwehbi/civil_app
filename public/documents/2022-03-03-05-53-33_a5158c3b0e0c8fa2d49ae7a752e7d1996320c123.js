import React, { useEffect, useState } from 'react';
import {
    InputLabel,
    TextField,
    TextFieldProps,
    Box,
    makeStyles,
    Card,
} from '@material-ui/core';
import { Field, useFormikContext } from 'formik';
import { Autocomplete } from '@material-ui/lab';
import { useTranslation } from 'react-i18next';

const useStyles = makeStyles((theme) => ({
    Circle: {
        height: '10px',
        width: '10px',
        backgroundColor: 'red',
        borderRadius: '50%',
        display: 'inline-block',
        margin: '3px',
        marginLeft: '12px',
    },
    inputLabel: {
        width: '100%',
        padding: '0px',
    },
}));

export default function FormikSelect({
    title,
    isRequired,
    setFieldValue,
    options,
    rightAdd,
    ...props
}) {
    const classes = useStyles();
    const { t } = useTranslation();

    const [value, setValue] = useState(null);
    const {
        initialValues,
        values,
        errors,
        touched,
        setFieldTouched,
    } = useFormikContext();

    useEffect(() => {
        setValue(
            initialValues[props.name]
                ? options[
                      options
                          .map((e) => e.value)
                          .indexOf(initialValues[props.name])
                  ]
                : null,
        );
    }, [options]);

    useEffect(() => {
        if (props.name.includes('.')) {
            if (
                values[props.name.substr(0, props.name.indexOf('.'))] !=
                undefined
            ) {
                let x = values;
                props.name.split('.').map((item) => {
                    if (x[item] == undefined) return;
                    x = x[item];
                });

                setValue(options[options.map((e) => e.value).indexOf(x)]);
            }
        } else {
            setValue(
                values[props.name]
                    ? options[
                          options
                              .map((e) => e.value)
                              .indexOf(values[props.name])
                      ]
                    : null,
            );
        }
    }, [values[props.name.split('.')[0]]]);

    const FSelect = ({ field, form, ...props }) => {
        return <Autocomplete {...field} {...props} />;
    };

    return (
        <div style={{ width: '100%' }}>
            <Box display="flex">
                <Box>
                    <InputLabel
                        style={{
                            color: 'black',
                            width: 'auto',
                        }}
                    >
                        {title}
                    </InputLabel>
                </Box>
                {isRequired && (
                    <Box>
                        <Card className={classes.Circle}></Card>
                    </Box>
                )}
            </Box>
            <Box display="flex">
                <Box flexGrow={1}>
                    <Field
                        {...props}
                        className={classes.inputLabel}
                        component={FSelect}
                        getOptionLabel={(option) => t(option.text)}
                        getOptionSelected={(option, value) => {
                            return value.value === option.value;
                        }}
                        options={options}
                        value={value}
                        onChange={(event, newValue) => {
                            setValue(newValue);
                            setFieldValue(
                                props.name,
                                newValue != null ? newValue.value : undefined,
                            );
                            newValue == null
                                ? setFieldTouched(props.name, true)
                                : setFieldTouched(props.name, false);
                        }}
                        renderInput={(params) => (
                            <TextField
                                helperText={
                                    errors[props.name] && touched[props.name]
                                        ? errors[props.name]
                                        : null
                                }
                                error={
                                    errors[props.name] && touched[props.name]
                                        ? true
                                        : false
                                }
                                {...params}
                            />
                        )}
                    />
                </Box>
                <Box>{rightAdd}</Box>
            </Box>
        </div>
    );
}
