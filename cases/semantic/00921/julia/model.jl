#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    k2 = 0.3
    k1 = 1.5 * k2
    
    # save results

    return (
        [ 0.0 ], # init for fake variable
        [
            k1,
            k2,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (k1,k2,) = p.static
    () = u 

    # Heta rules
    
    #p.static .= [k1,k2,]
    du .= [ 1.0 ] # RHS for fake variable
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (k1,k2,) = integrator.p.static
        () = u

        # Heta rules
        
        # calculate amounts
        k1_ = k1
        k2_ = k2

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00921 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00921 = x00921
)
tasks = ()

export models, tasks

end
