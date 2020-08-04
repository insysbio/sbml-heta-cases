#= 
    This code was generated by heta-compiler of v0.5.9
    
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
    k2 = 0.0
    k1 = 1.5e-4
    k3 = 1.0
    k1_proc = (-1.0) * k1 * k3 * t
    k2_proc = k1 * k3 * t
    
    # save results

    return (
        [
            k1,
            k2,
        ],
        
        [
            k3,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (k3,) = p.static
    (k1_,k2_,) = u 

    # Heta rules
    k2 = k2_
    k1 = k1_
    k1_proc = (-1.0) * k1 * k3 * t
    k2_proc = k1 * k3 * t
    
    #p.static .= [k3,]
    du .= [
      k1_proc,  # dk1_/dt
      k2_proc,  # dk2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (k3,) = integrator.p.static
        (k1_,k2_,) = u

        # Heta rules
        k2 = k2_
        k1 = k1_
        k1_proc = (-1.0) * k1 * k3 * t
        k2_proc = k1 * k3 * t
        
        # calculate amounts
        k3_ = k3
        k1_proc_ = k1_proc
        k2_proc_ = k2_proc

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events

### continous events

### event assignments


### OUTPUT ###

x00891 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00891 = x00891
)
tasks = ()

export models, tasks

end
